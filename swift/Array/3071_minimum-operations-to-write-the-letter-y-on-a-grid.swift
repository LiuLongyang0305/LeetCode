
//https://leetcode.com/problems/minimum-operations-to-write-the-letter-y-on-a-grid/

class Solution {
    func minimumOperationsToWriteY(_ grid: [[Int]]) -> Int {
        let N = grid.count
        let half = N / 2
        func isOnY(_ r: Int, _ c: Int) -> Bool {
            if r <= half {
                return r == c || r + c == N - 1
            } else {
                return c == half
            }

        }
        func cal(_ y: Int, _ notY: Int) -> Int {
            var ans = 0
            for i in 0..<N {
                for j in 0..<N {
                    ans +=  isOnY(i, j) ? (grid[i][j] == y ? 0 : 1) : (grid[i][j] == notY ? 0 : 1)
                }
            }

            return ans
        }
        var ans = Int.max
        for y in 0...2 {
            for notY in 0...2 {
                guard y != notY else {continue}
                ans = min(ans, cal(y, notY))
            }
        }

        return ans
    }
}
