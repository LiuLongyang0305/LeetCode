    //https://leetcode.cn/problems/maximize-pair-strength-using-gcd/
    class Solution {
        func maxPairStrength(_ nums: [Int]) -> Int {
            let M = nums.count
            var sb = 0
            for i in 0..<M {
                for j in stride(from: i + 1, to: M, by: 1) {
                    let t = _gcd(nums[i], nums[j])
                    sb = max(sb,nums[i] / t * nums[j] / t )
                }
            }
            return sb
        }
        private func _gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : _gcd(b, a % b)
        }
    }
