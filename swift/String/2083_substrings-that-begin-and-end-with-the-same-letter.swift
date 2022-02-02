//  https://leetcode.com/problems/substrings-that-begin-and-end-with-the-same-letter/
class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var ans = 0
        var counter = [Character:Int]()
        for ch in s {
            counter[ch, default: 0] += 1
            ans += counter[ch] ?? 0
        }
        return ans
    }
}