    //https://leetcode.cn/problems/concatenate-non-zero-digits-and-multiply-by-sum-i/
    class Solution {
        func sumAndMultiply(_ n: Int) -> Int {
            let sb =  getNotZeroDigits(of: n)

            return sb.newNum * sb.sum
        }

        private func getNotZeroDigits(of num: Int) -> (sum:Int,newNum:Int) {
            var sum = 0
            var newSum = 0
            var base = 1
            var t = num
            while t > 0 {
                let digit = t % 10
                if digit > 0 {
                    sum += digit
                    newSum = digit * base  + newSum
                    base *= 10
                }
                t /= 10
            }
            return (sum,newSum)
        }
    }
