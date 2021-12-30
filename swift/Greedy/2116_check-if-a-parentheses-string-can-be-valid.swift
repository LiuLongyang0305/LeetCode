// https://leetcode.com/problems/check-if-a-parentheses-string-can-be-valid/
class Solution {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        let N = s.count
        var sToChars = [Character](s)
        let lockedChars = [Character](locked)
        
        var x = 0
        var cnt = 0
        for i in 0..<N {
            if lockedChars[i] == "0" {
                cnt += 1
                sToChars[i] = ")"
            }
            if sToChars[i] == "(" {
                x += 1
            } else {
                x -= 1
            }
            if x < 0 {
                guard cnt != 0 else {
                    return false
                }
                cnt -= 1
                x += 2
            }
        }
        return x == 0
    }
}