// https://leetcode.com/problems/substrings-of-size-three-with-distinct-characters/
class Solution {
    func countGoodSubstrings(_ s: String) -> Int {
        guard s.count > 2 else {
            return 0
        }
        let chars = [Character](s)
        var idx = 0
        var cnt = 0
        while idx <= s.count - 3 {
            if chars[idx] != chars[idx + 1] && chars[idx + 1] != chars[idx + 2] && chars[idx] != chars[idx + 2] {
                cnt += 1
            }
            idx += 1
        }
        return cnt
    }
}