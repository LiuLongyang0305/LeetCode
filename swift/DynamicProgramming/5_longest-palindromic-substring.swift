// https://leetcode.com/problems/longest-palindromic-substring/submissions/
class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        guard s.count > 2 else {
            return s.first! == s.last! ? s : "\(s.first!)"
        }
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: true, count: s.count), count: s.count)
        for i in 0..<s.count {
            dp[i][i] = true
        }
        let N = s.count
        let chars = [Character](s)
        
        var startIdx = 0
        var anslength = 1
        
        for length in 2...N {
            var left = 0
            while left < N {
                let right = left + length - 1
                guard right < N else {
                    break
                }
                if chars[left] != chars[right] {
                    dp[left][right] = false
                } else {
                    if length <= 3 {
                        dp[left][right] = true
                    } else {
                        dp[left][right] = dp[left + 1][right - 1]
                    }
                }
                if dp[left][right] {
                    if length > anslength {
                        anslength = length
                        startIdx = left
                    }
                }
                left += 1
            }
        }
        return String(chars[startIdx..<(startIdx + anslength)])
    }
}
// Solution().longestPalindrome("abcda")

