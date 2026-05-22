 // https://leetcode.cn/problems/remove-zeros-in-decimal-representation/
    class Solution {
        func removeZeros(_ n: Int) -> Int {
            var digits = [Int]()
            var t = n
            while t > 0 {
                let d = t % 10
                if d != 0 {
                    digits.insert(d, at:0 )
                }
                t /= 10
            }
            var sb = 0
            for d in digits {
                sb += d
                sb *= 10
            }
            return sb / 10
        }
    }
