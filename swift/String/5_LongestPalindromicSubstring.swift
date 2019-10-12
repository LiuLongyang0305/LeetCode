// https://leetcode.com/problems/longest-palindromic-substring/
class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        let length = s.count
        var left = -1
        var  right = -1
        var maxLength  = 1
        let chars = Array<Character>(s)
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: length), count: length)
        var i = length - 1
        while i >= 0 {
            for j in i..<length {
                dp[i][j] = chars[i] == chars[j] && (j - i < 2 || dp[i + 1][j - 1])
                if dp[i][j] {
                    if j - i + 1 > maxLength {
                        left = i
                        right = j
                        maxLength = j - i  + 1
                    }
                }
            }
            i -= 1
        }
        
        return  left == -1 ? String(chars[0]) : String(chars[left...right])
    }
}

class Solution2 {
    var sourceStrChars = [Character]()
    var length = -1
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        self.sourceStrChars = Array<Character>(s)
        self.length = s.count
        var start = 0
        var end = 0
        var maxLendth = 0
        for i in 0..<length {
            let len1 = expandAroundCenter(i, right: i)
            let len2 = expandAroundCenter(i, right: i + 1)
            let temp = max(len1, len2)
            if temp > end - start {
                if temp == len2  {
                    start = i - temp / 2 + 1
                    end = i + temp / 2
                } else {
                    start = i - (temp - 1) / 2
                    end = i + (temp - 1) / 2
                }
            }
        }
        return  String(sourceStrChars[start...end])
    }
    private func expandAroundCenter(_ left: Int, right: Int) -> Int {
        var L = left
        var R =  right
        while L >= 0 && R < length && sourceStrChars[L] == sourceStrChars[R] {
            L -= 1
            R += 1
        }
        L += 1
        R -= 1
        return R - L + 1
    }
}
