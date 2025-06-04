//https://leetcode.com/problems/most-frequent-prime/
extension Int {
    /// 判断当前整数是否为质数
    var isPrime: Bool {
        // 处理边界情况 [1,3](@ref)
        guard self > 1 else { return false }
        if self == 2 || self == 3 { return true }

        // 排除偶数（除2外）[1,2](@ref)
        guard self % 2 != 0 else { return false }

        // 优化检查范围：只需检查到平方根 [1,3,4,6](@ref)
        let squareRoot = Int(Double(self).squareRoot())

        // 从3开始步进2（跳过偶数）检查因子 [1,4](@ref)
        for divisor in stride(from: 3, through: squareRoot, by: 2) {
            if self % divisor == 0 {
                return false
            }
        }
        return true
    }
}
class Solution {

    private typealias Direction = (dx:Int,dy:Int)
    private let dirs:[Direction] = [(0,1),(0,-1),(1,0),(-1,0),(1,1),(1,-1),(-1,-1),(-1,1)]
    func mostFrequentPrime(_ mat: [[Int]]) -> Int {

        let M = mat.count
        let N = mat[0].count

        func cal(_ r: Int, _ c: Int, _ cur: Int, _ dir: Direction) -> [Int:Int] {
            var counter = [Int: Int]()

            var step = 1
            var temp = cur
            while true {
                let nx = r + dir.dx * step
                let ny = c + dir.dy * step
                guard nx >= 0 && nx < M && ny >= 0 && ny < N else {break}
                temp *= 10
                temp += mat[nx][ny]
                if temp > 10 && temp.isPrime {
                    counter[temp,default: 0] += 1
                }
                step += 1
            }


            return counter
        }



        var counter = [Int:Int]()
        for i in 0..<M {
            for j in 0..<N {
                for dir in dirs {
                    for (v,cnt) in cal(i, j, mat[i][j], dir) {
                        counter[v,default: 0] += cnt
                    }
                }
            }
        }
        guard !counter.isEmpty else {return -1}
            let sortedCounter = counter.sorted { p1,p2 in
            if p1.value == p2.value {
                return p1.key > p2.key
            }
            return p1.value > p2.value
        }
        return sortedCounter[0].key
    }
}
