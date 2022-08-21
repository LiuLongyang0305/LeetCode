// https://leetcode.com/problems/largest-palindromic-number/
class Solution {
    func largestPalindromic(_ num: String) -> String {
        var counter = [Int](repeating: 0, count: 10)
        for digit in num {
            counter[Int(digit.asciiValue ?? 0) - 48] += 1
        }
        guard counter[0] != num.count else {return "0"}
        var left = ""
        for num in stride(from: 9, through: 0, by: -1) {
            if counter[num] >= 2 {
                let c = counter[num] / 2
                let s = String(repeating: "\(num)", count: c)
                left.append(s)
            }
        }
        if let f = left.first, f == "0" {
            left = ""
        }
        let mid = counter.lastIndex { $0 % 2 == 1} ?? -1
        return left + (mid == -1 ? "" : "\(mid)") + String(left.reversed())
    }
}
