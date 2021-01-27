// https://leetcode.com/problems/latest-time-by-replacing-hidden-digits/
class Solution {
    func maximumTime(_ time: String) -> String {
        var chars = [Character](time)
        if chars[0] == "?" {
            chars[0] = (chars[1] == "?" || chars[1] == "1" || chars[1] == "2" || chars[1] == "3" || chars[1] == "0") ? "2" : "1"
        }
        if chars[1] == "?" {
            chars[1] = chars[0] == "2" ? "3" : "9"
        }
        if chars[3] == "?" {
            chars[3] = "5"
        }
        if chars[4] == "?" {
            chars[4] = "9"
        }
        return String(chars)
    }
}