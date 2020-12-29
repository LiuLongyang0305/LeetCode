// https://leetcode.com/problems/where-will-the-ball-fall/
class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        let M = grid.count
        let N = grid[0].count
        var ans = [Int]()
        
        func getBallLastPosition(_ from: Int) -> Int {
            var c1 = from
            var c2 = -1
            for r in 0..<M {
                c2 = c1 + grid[r][c1]
                if c2 < 0 || c2 >= N || grid[r][c2] != grid[r][c1] {
                    return -1
                }
                c1 = c2
            }
            return c1
        }
        for c in 0..<N {
            ans.append(getBallLastPosition(c))
        }
        return ans
    }
}

