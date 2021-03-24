// https://leetcode.com/problems/second-largest-digit-in-a-string/
class Solution {
    func secondHighest(_ s: String) -> Int {
        var numbers = Set<Int>()
        for ch in s {
            if ch.isNumber {
                numbers.insert(Int(ch.asciiValue! - 48))
            }
        }
        guard numbers.count >= 2 else {
            return -1
        }
        let sortedNumbers = numbers.sorted { $0 > $1}
        return sortedNumbers[1]
    }
}