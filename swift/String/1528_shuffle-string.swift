// https://leetcode.com/problems/shuffle-string/
class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var ans = Array<Character>(repeating: " ", count: indices.count)
        var i = 0
        for ch in s {
            ans[indices[i]] = ch
            i += 1
        }
        return String(ans)
    }
}