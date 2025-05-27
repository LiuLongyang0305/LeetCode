//https://leetcode.cn/problems/check-knight-tour-configuration/

class Solution {
    private typealias Pair = (x:Int,y:Int)
    private typealias Direction = (dx:Int,dy:Int)
    private let dirs :[Direction] = [(2,1),(2,-1),(-2,1),(-2,-1),(1,2),(1,-2),(-1,2),(-1,-2)]
    func checkValidGrid(_ grid: [[Int]]) -> Bool {
        guard grid[0][0] == 0 else {return false}
        let N = grid.count
        var steps = [Pair](repeating: (0,0), count: N * N)
        for i in 0..<N {
            for j in 0..<N {
                steps[grid[i][j]] = (i,j)
            }
        }

        for i in 1..<(N * N) {
            if !check(steps[i - 1], steps[i]) {
                return false
            }
        }

        return true
    }


    private func check(_ from:Pair, _ to: Pair) -> Bool {

        for (dx,dy) in dirs {
            let nx = from.x + dx
            let ny = from.y + dy
            if nx == to.x && ny == to.y {
                return true
            }
        }

        return false
    }


}
