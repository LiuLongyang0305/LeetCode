// https://leetcode.com/problems/edit-distance/
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard !word1.isEmpty && !word2.isEmpty else {
            return max(word2.count,word1.count)
        }
        let word1ToChars = [Character](word1)
        let word2ToChars = [Character](word2)
        
        let M = word1.count
        let N = word2.count
        
        var editDistances = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: M)
        for j in 0..<N {
            if word1ToChars[0] == word2ToChars[j] {
                editDistances[0][j] = j
            } else {
                editDistances[0][j] = (j == 0 ? 0 : editDistances[0][j - 1]) + 1
            }
        }
        for i in 0..<M {
            if word1ToChars[i] == word2ToChars[0] {
                editDistances[i][0] = i
            } else  {
                editDistances[i][0] = 1 + (i == 0 ? 0 : editDistances[i - 1][0])
            }
        }
        for i in 1..<M {
            for j in 1..<N {
                editDistances[i][j] = min(editDistances[i - 1][j ] + 1, editDistances[i][ j - 1] + 1, editDistances[i - 1][j - 1] + (word2ToChars[j] == word1ToChars[i] ? 0 : 1))
            }
        }
        return editDistances[M - 1][N - 1]
    }
 }

