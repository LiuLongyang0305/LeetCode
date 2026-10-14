// https://leetcode.cn/problems/apply-operations-on-array-to-maximize-sum-of-squares/
class Solution {
    private let MOD = 1_000_000_007
    func maxSum(_ nums: [Int], _ k: Int) -> Int {
        var DigitsCounter = [Int](repeating: 0, count: 30)
        for num in nums {
            for i in 0..<30 {
                if (num >> i ) & 1 == 1 {
                    DigitsCounter[i] += 1
                }
            }
        }
        var ans = 0
        for _ in 0..<k {
            var x = 0
            for i in 0..<30 {
                if DigitsCounter[i] > 0 {
                    if DigitsCounter[i] > 0 {
                        DigitsCounter[i] -= 1
                        x = x | (1 << i)
                    }
                }
            }
            ans += x * x % MOD
            ans %= MOD
        }
        return ans
    }
}
