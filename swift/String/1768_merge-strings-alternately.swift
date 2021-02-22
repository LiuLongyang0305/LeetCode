// https://leetcode.com/problems/merge-strings-alternately/
class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var ans = ""
        var idx1 = word1.startIndex
        var idx2 = word2.startIndex
        while idx1 < word1.endIndex || idx2 < word2.endIndex  {
            if idx1 != word1.endIndex {
                ans.append(word1[idx1])
                idx1 = word1.index(after: idx1)
            }
            if idx2 != word2.endIndex {
                ans.append(word2[idx2])
                idx2 = word2.index(after: idx2)
            }
        }
        return ans
    }
}