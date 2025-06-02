//https://leetcode.com/problems/difference-of-number-of-distinct-values-on-diagonals
class Solution {
    func differenceOfDistinctValues(_ grid: [[Int]]) -> [[Int]] {
        let M = grid.count
        let N = grid[0].count
        var ans = [[Int]](repeating: [Int](repeating: 0, count: N), count: M)
        for i in 0..<M {
            for j in 0..<N {

                var setTopLeft = Set<Int>()
                var setRightBottom = Set<Int>()

                var p = i - 1
                var q = j - 1
                while p >= 0 && q >= 0 {
                    setTopLeft.insert(grid[p][q])
                    p -= 1
                    q -= 1
                }

                p = i + 1
                q = j + 1
                while p < M && q < N {
                    setRightBottom.insert(grid[p][q])
                    p += 1
                    q += 1
                }

                ans[i][j] = abs(setTopLeft.count - setRightBottom.count)
            }
        }
        return ans
    }
}
