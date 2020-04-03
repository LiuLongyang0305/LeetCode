// https://leetcode.com/problems/delete-columns-to-make-sorted-iii/
class Solution {
    func minDeletionSize(_ A: [String]) -> Int {
        
        let M = A.count
        let N = A[0].count
        let matrix = A.map {$0.map { $0.asciiValue!}}
        var dp = Array<Int>(repeating: 1, count: N)
        var c = N - 2
        while c >= 0 {
            label:  for j in (c + 1)..<N {
                for r in 0..<M {
                    if matrix[r][c] > matrix[r][j] {
                        continue label
                    }
                }
                dp[c] = max(dp[c], 1 + dp[j])
            }
            c -= 1
        }
        return N - dp.max()!
    }
}