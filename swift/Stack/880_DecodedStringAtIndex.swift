//https://leetcode.com/problems/decoded-string-at-index/
class Solution {
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        let SToArray = Array<Character>(S)
        var size: Int = 0
        for ch in S {
            if ch.isNumber {
                size *= Int("\(ch)")!
            } else {
                size += 1
            }
        }
        var temp = K
        var i = S.count - 1
        while i >= 0 {
            print("target = \(temp)  strSize = \(size)")
            temp %= size
            let currentChar = SToArray[i]
            if temp == 0 && currentChar.isLowercase {
                return "\(currentChar)"
            }
            if currentChar.isNumber{
                size /= Int("\(currentChar)")!
            } else {
                size -= 1
            }
            i -= 1
        }
        return ""
    }
}

Solution().decodeAtIndex("leet2code3",10)

