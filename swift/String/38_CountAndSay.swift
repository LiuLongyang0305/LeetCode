// https://leetcode.com/problems/count-and-say/
class Solution {
    func countAndSay(_ n: Int) -> String {
        var ans = ""
        if  n == 1 {
            return "1"
        }
        var last = "1"
        for _ in 2...n {
            ans = ""
            let  chars = Array<Character>(last)
            var count = 0
            for i in 0..<chars.count {
                if i == 0 {
                    count = 1
                } else {
                    if chars[i] == chars[i - 1] {
                        count += 1
                    } else {
                        ans += "\(count)\(chars[i - 1])"
                        count = 1
                    }
                }
            }
            ans += "\(count)\(chars.last!)"
            last = ans
        }
        return ans
    }
}
