//https://leetcode.com/problems/check-if-digits-are-equal-in-string-after-operations-i/
class Solution {
    func hasSameDigits(_ s: String) -> Bool {
        var curDigits = s.map { Int($0.asciiValue! - 48)}
        while curDigits.count > 2 {
            var new = [Int]()
            for i in 1..<curDigits.count {
                new.append((curDigits[i] + curDigits[i - 1]) % 10)
            }
            print(new)
            curDigits = new
        }
        return curDigits[0] == curDigits[1]
    }
}