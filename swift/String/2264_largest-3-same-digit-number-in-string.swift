// https://leetcode.com/problems/largest-3-same-digit-number-in-string/
class Solution {
    func largestGoodInteger(_ num: String) -> String {
        for digit in stride(from: 9, through: 0, by: -1) {
            let substr = String(repeating: "\(digit)", count: 3)
            guard !num.contains(substr) else {return substr}
        }
        return ""
    }
}