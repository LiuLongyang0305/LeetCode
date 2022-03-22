// https://leetcode.com/problems/minimum-number-of-moves-to-make-palindrome/
class Solution1 {
    func minMovesToMakePalindrome(_ s: String) -> Int {
        var chars = [Character](s)
        var ans = 0
        while !chars.isEmpty {
            let idx = chars.firstIndex(of: chars.last!)!
            if idx == chars.count - 1 {
                ans += idx / 2
            } else {
                ans += idx
                chars.remove(at: idx)
            }
            chars.removeLast()
        }
        return ans
    }
}

class Solution {
    func minMovesToMakePalindrome(_ s: String) -> Int {
        
        
        func dfs(_ chars: [Character]) -> Int {
            guard !chars.isEmpty else {
                return 0
            }
            guard let idx = chars.firstIndex(of: chars.last!) else {return -1}
            if idx == chars.count - 1 {
                return idx / 2 + dfs([Character](chars.dropLast()))
            } else {
                var newChars = chars
                newChars.remove(at: idx)
                newChars.removeLast()
                return idx + dfs(newChars)
            }
        }
        return dfs([Character](s))
    }
}