// https://leetcode.com/problems/split-a-string-into-the-max-number-of-unique-substrings/
class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        var seen = Set<String>()
        return helper(s: s, seen: &seen)
    }
    private func helper(s: String, seen: inout Set<String>) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        var ans = 0
        var index = s.startIndex
        while index < s.endIndex {
            let candidate = String(s[...index])
            if !seen.contains(candidate) {
                seen.insert(candidate)
                ans = max(ans, 1 + helper(s: String(s[s.index(after: index)...]), seen: &seen))
                seen.remove(candidate)
            }
            index = s.index(after: index)
        }
        return ans
    }
}