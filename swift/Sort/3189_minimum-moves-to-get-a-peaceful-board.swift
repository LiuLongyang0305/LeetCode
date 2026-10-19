    // https://leetcode.cn/problems/minimum-moves-to-get-a-peaceful-board/
    class Solution {
        func minMoves(_ rooks: [[Int]]) -> Int {
            var cnt = 0
            let sortedByRow = rooks.sorted { r1, r2 in
                r1[0] < r2[0]
            }
            for i in 0..<rooks.count {
                cnt += abs(i - sortedByRow[i][0])
            }
            let sortedByCol = rooks.sorted { r1, r2 in
                r1[1] < r2[1]
            }
            for i in 0..<rooks.count {
                cnt += abs(i - sortedByCol[i][1])
            }
            return cnt
        }
    }
