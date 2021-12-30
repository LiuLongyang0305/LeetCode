// https://leetcode.com/problems/maximum-number-of-words-found-in-sentences/
class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        var ans = 0
        for sentence in sentences {
            ans = max(ans,sentence.split(separator: " ").count)
        }
        return ans
    }
}