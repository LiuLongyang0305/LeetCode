// https://leetcode.com/problems/longest-chunked-palindrome-decomposition/
class Solution {
    private var memo = [String:Int]()
    func longestDecomposition(_ text: String) -> Int {
        self.memo = [:]
        return helper(text)
    }
    private func helper(_ text: String) -> Int {
        guard text.count > 1 else {
            return text.count
        }
        
        guard nil == memo[text] else {
            return memo[text]!
        }
        var ans = 1
        var length = 1
        let maxPreffixLength = text.count >> 1
        while length <= maxPreffixLength {
            if text.prefix(length) == text.suffix(length) {
                ans = max(ans, 2 + helper(String(text.dropFirst(length).dropLast(length))))
            }
            length += 1
        }
        memo[text] = ans
        return ans
    }
}