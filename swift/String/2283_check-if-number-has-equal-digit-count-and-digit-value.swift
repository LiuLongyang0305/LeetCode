//  https://leetcode.com/problems/check-if-number-has-equal-digit-count-and-digit-value/
class Solution {
    func digitCount(_ num: String) -> Bool {
        let digits = num.map {Int($0.asciiValue! - 48)}
        let N = digits.count
        var counter = [Int:Int]()
        digits.forEach { counter[$0, default: 0] += 1}
        for i in 0..<N {
            guard digits[i] == counter[i] ?? 0 else {
                return false
            }
        }
        return true
    }
}