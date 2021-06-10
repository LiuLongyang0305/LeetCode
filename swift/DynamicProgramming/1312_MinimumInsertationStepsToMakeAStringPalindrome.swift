//https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/
class Solution {
    func minInsertions(_ s: String) -> Int {
        var chars = [Character](s)
        var i = 0
        var j = s.count - 1
        while i < j {
            if chars[i] != chars[j] {
                break
            }
            i += 1
            j -= 1
        }
        guard i < j else {
            return 0
        }
        guard s.count != 2 else {
            return 1
        }
        chars.removeFirst(i)
        chars.removeLast(s.count - j - 1)
        let N = chars.count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: N + 1)
        
         i = N - 1
        while i >= 0 {
            j = i + 1
            while j < N {
                if chars[i] == chars[j] {
                    dp[i][j] = dp[i + 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i][j - 1], dp[i + 1][j]) + 1
                }
                j += 1
            }
            i -= 1
        }
        return dp[0][N - 1]
    }
 }


 class Solution {
    private var memo = [Int:Int]()
    private var text = [Character]()
    func minInsertions(_ s: String) -> Int {
        self.memo = [:]
        self.text = [Character](s)
        return helper(0,s.count - 1)
    }
    func helper(_ left: Int, _ right: Int) -> Int {
        guard right > left else {
            return 0
        }
        guard right - left > 1 else {
            return text[left] == text[right] ? 0 : 1
        }
        let key = left << 32 | right
        guard nil == memo[key] else {
            return memo[key]!
        }
        var ans = 0
        if text[left] == text[right] {
            ans = helper(left + 1, right - 1)
        } else {
            ans = 1 + min(helper(left + 1, right), helper(left, right - 1))
        }
        memo[key] = ans
        return ans
    }
}