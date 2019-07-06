//https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/
class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        var ans = 0
        let s1Size = s1.count
        let s2Size = s2.count
        let s1ToChars = Array<Character>(s1)
        let s2ToChars = Array<Character>(s2)
        let s1ToInt = s1ToChars.map { (char) -> Int in
           Int( char.asciiValue!)
        }
        let s2ToInt = s2ToChars.map { (char) -> Int in
            Int(char.asciiValue!)
        }
        var maxCls = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: s2Size), count: s1Size)
        for j in 0..<s2Size {
            if s2ToInt[j] == s1ToInt[0] {
                maxCls[0][j] = s1ToInt[0]
            } else if j != 0 {
                maxCls[0][j] = maxCls[0][j - 1]
            } else {
                maxCls[0][j] = 0
            }
        }
        for i in 0..<s1Size {
            if s1ToInt[i] == s2ToInt[0] {
                maxCls[i][0] = s2ToInt[0]
            } else if i != 0 {
                maxCls[i][0] = maxCls[i - 1][0]
            } else {
                maxCls[i][0] = 0
            }
        }
        
        for i  in 1..<s1Size {
            for j in 1..<s2Size {
                if s1ToInt[i] == s2ToInt[j] {
                    maxCls[i][j] = max(maxCls[i - 1][j], maxCls[i][j - 1], maxCls[i - 1][j - 1] + s1ToInt[i])
                } else {
                    maxCls[i][j] = max(maxCls[i - 1][j], maxCls[i][j - 1], maxCls[i - 1][j - 1])
                }
            }
        }
        for ele in s1ToInt {
            ans += ele
        }
        for ele in s2ToInt {
            ans += ele
        }
        return ans - 2 * maxCls[s1Size - 1][s2Size - 1]
    }
}

let s1 = "delete"
let s2 = "leet"
Solution().minimumDeleteSum(s1, s2)
