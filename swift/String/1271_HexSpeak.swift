// https://leetcode.com/problems/hexspeak/
class Solution {
    func toHexspeak(_ num: String) -> String {
        guard var temp = Int(num) else {
            return ""
        }
        var ans = ""
        while temp > 0 {
            let r = temp % 16
            switch r {
            case 10...15:
                ans.insert( Character(Unicode.Scalar(55 + UInt8(r))), at: ans.startIndex)
            case 0:
                ans.insert("O", at: ans.startIndex)
            case 1:
                ans.insert("I", at: ans.startIndex)
            default:
                return "ERROR"
            }
            temp /= 16
        }
        return ans
    }
}