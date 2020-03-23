// https://leetcode.com/problems/four-divisors/
class Solution {
    func sumFourDivisors(_ nums: [Int]) -> Int {
        var ans = 0
        func fourDivisorsSum(of num: Int) -> Int? {
            var divisorsCount = 0
            var ans = 0
            for i in 1...Int(sqrt(Double(num))) {
                if num % i == 0 {
                    let another = num / i
                    if i == another {
                        ans += i
                        divisorsCount += 1
                    } else {
                        ans += i + another
                        divisorsCount += 2
                    }
                    guard divisorsCount <= 4 else {
                        return nil
                    }
                }
            }
            
            return divisorsCount == 4 ? ans : nil
        }
        for num in nums {
            if let s = fourDivisorsSum(of: num) {
                ans += s
            }
        }
        return ans
    }
}

