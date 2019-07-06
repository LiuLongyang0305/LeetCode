// https://leetcode.com/problems/perfect-number/
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        if num <= 1 {
            return false
        }
        var sum = 1
        var i = 2
        while i * i <= num {
            if num % i == 0 {
                sum += i
                if i * i != num {
                    sum += num / i
                }
            }
            i += 1
        }
        return sum == num
    }
}