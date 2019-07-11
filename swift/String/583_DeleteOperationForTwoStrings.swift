//https://leetcode.com/problems/delete-operation-for-two-strings/
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word2 == word1 {
            return 0
        }
        let rowSize = word1.count
        let colSize = word2.count
        if word2.isEmpty || word1.isEmpty {
            return rowSize + colSize
        }
        let word1ToArray = Array<Character>(word1)
        let word2ToArray = Array<Character>(word2)

        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: colSize), count: rowSize)
        for i in 0..<colSize {
            if  word2ToArray[i] == word1ToArray[0] {
                dp[0][i] = 1
            } else if i == 0 {
                dp[0][0] = 0
            } else {
                dp[0][i] = dp[0][i - 1]
            }
        }
        for i in 0..<rowSize {
            if  word1ToArray[i] == word2ToArray[0] {
                dp[i][0] = 1
            } else if i == 0 {
                dp[i][0] = 0
            } else {
                dp[i][0] = dp[i - 1][0]
            }
        }
        for i in 1..<rowSize {
            for j in 1..<colSize {
                if  word1ToArray[i] == word2ToArray[j] {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] + 1)
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1])
                }
            }
        }
        return rowSize + colSize - 2 * dp[rowSize - 1][colSize - 1]
    }
}
