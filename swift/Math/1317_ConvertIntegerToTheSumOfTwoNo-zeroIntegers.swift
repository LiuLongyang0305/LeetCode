// https://leetcode.com/problems/convert-integer-to-the-sum-of-two-no-zero-integers/  
class Solution {
    func getNoZeroIntegers(_ n: Int) -> [Int] {
        func isOk(_ num: Int) -> Bool {
            var temp = num
            while temp > 0 {
                if temp % 10 == 0 {
                    return false
                }
                temp /= 10
            }
            return true
        }
        for num in 1...(n >> 1) {
            if isOk(num) && isOk(n - num) {
                return [num, n - num]
            }
        }
        return []
    }
 }
 

