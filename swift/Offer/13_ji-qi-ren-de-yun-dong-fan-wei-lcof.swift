// https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
class Solution {
    private typealias Direction  = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var ans = 0
        var queue: [Int] = [0]
        var visited = Set<Int>()
        visited.insert(0)
        func valid(_ x: Int,_ y: Int) -> Bool {
            return x < m && x >= 0 && y < n && y >= 0 && (x % 10 + x / 10 + y % 10 + y / 10) <= k
        }
        while !queue.isEmpty {
            
            ans += queue.count
            var nextLevel = [Int]()
            for p in queue {
                let x = p >> 8
                let y = p & 0xff
                for dir in directions {
                    let nextX = x + dir.dx
                    let nextY = y + dir.dy
                    let nextP = nextX << 8 | nextY
                    if valid(nextX, nextY) && !visited.contains(nextP) {
                        nextLevel.append(nextP)
                        visited.insert(nextP)
                    }
                }
            }
            queue = nextLevel
        }
        return ans
    }
}