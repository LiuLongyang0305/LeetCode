// https://leetcode.com/problems/truncate-sentence/
class Solution {
    func truncateSentence(_ s: String, _ k: Int) -> String {
        let words = s.split(separator: " ").map {String($0)}
        var ans = ""
        for idx in 0..<k {
            ans.append(words[idx])
            ans.append(" ")
        }
        ans.removeLast()
        return ans
    }
}