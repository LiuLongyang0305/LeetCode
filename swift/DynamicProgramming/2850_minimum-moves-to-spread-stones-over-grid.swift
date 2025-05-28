//https://leetcode.com/problems/minimum-moves-to-spread-stones-over-grid/
class Solution {
    private typealias Position = (x: Int, y: Int)
    func minimumMoves(_ grid: [[Int]]) -> Int {
        var memo = [Int:Int]()
        func dfs(_ cur: [[Int]]) -> Int {
            var left = [Position]()
            var right = [Position]()

            for i in 0..<3 {
                for j in 0..<3 {
                    if cur[i][j] > 1 {
                        left.append((i,j))
                    }
                    if cur[i][j] == 0 {
                        right.append((i,j))
                    }
                }
            }
            guard !left.isEmpty else {return 0}
            if let v = memo[cur.hashValue] {
                return v
            }
            var ans = Int.max / 2
            for (x1,y1) in left {
                for (x2,y2) in right {
                    var temp = cur
                    temp[x1][y1] -= 1
                    temp[x2][y2] += 1
                    ans = min(ans, abs(x1 - x2) + abs(y1 - y2) + dfs(temp))
                }
            }
            memo[cur.hashValue] = ans
            return ans
        }
        return dfs(grid)
    }
}
