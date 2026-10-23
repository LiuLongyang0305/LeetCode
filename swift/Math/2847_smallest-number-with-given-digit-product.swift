    // https://leetcode.cn/problems/smallest-number-with-given-digit-product/
    class Solution {
        func smallestNumber(_ n: Int) -> String {
            if n < 10 {return "\(n)"}
            var digits = [Int]()
            var cur = n
            var isChanged = false
            repeat {
                isChanged = false
                for digit in stride(from: 9, to: 2, by: -1) {
                    while cur % digit == 0 {
                        isChanged = true
                        digits.append(digit)
                        cur /= digit
                    }
                }
            } while(isChanged)
            if cur > 10 {
                return "-1"
            }
            if cur != 1 {
                digits.append(cur)
            }
           
            return digits.sorted().reduce("") { $0 + "\($1)"}
        }
    }
