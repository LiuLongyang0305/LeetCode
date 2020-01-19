// https://leetcode.com/problems/maximum-69-number/
class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var chars = [Character]("\(num)")
        for i in 0..<chars.count {
            if chars[i] == "6" {
                chars[i] = "9"
                break
            }
        }
        return Int(String(chars))!
    }
 }