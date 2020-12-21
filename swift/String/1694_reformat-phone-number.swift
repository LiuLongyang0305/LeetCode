// https://leetcode.com/problems/reformat-phone-number/
class Solution {
    func reformatNumber(_ number: String) -> String {
        var str = ""
        number.forEach { (ch) in
            if ch.isNumber {
                str.append(ch)
            }
        }
        var ans = ""
        while str.count > 4 {
            let temp = String(str.prefix(3)) + "-"
            ans.append(temp)
            str.removeFirst(3)
        }
        if !(str.count == 4) {
            ans.append(str)
        } else {
            ans.append(String(str.prefix(2)))
            ans.append("-")
            ans.append(String(str.suffix(2)))
        }
        return ans
    }
}

