// https://leetcode.com/problems/remove-palindromic-subsequences/
class Solution {
     func removePalindromeSub(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        let chars = [Character](s)
        let length = s.count
        for i in 0..<(length >> 1) {
            if chars[i] != chars[length - 1 - i] {
                return 2
            }
        }
        return 1
     }
 }

