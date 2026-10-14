    //https://leetcode.cn/problems/phone-number-prefix/
    class Solution {
        func phonePrefix(_ numbers: [String]) -> Bool {
            let M = numbers.count
            let sortedNumbers = numbers.sorted { $0.count < $1.count}
            for (i,f) in sortedNumbers.enumerated() {
                for j in stride(from: i + 1, to: M, by: 1) {
                    guard !sortedNumbers[j].hasPrefix(f) else {return false}
                }
            }
            return true
        }
    }
