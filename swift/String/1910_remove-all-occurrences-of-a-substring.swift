// https://leetcode.com/problems/remove-all-occurrences-of-a-substring/
class Solution {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        var ans = s
        while let range = ans.range(of: part) {
            ans.removeSubrange(range)
        }
        return ans
    }
}


