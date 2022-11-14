// https://leetcode.com/problems/number-of-subarrays-with-lcm-equal-to-k/
class Solution {
    func subarrayLCM(_ nums: [Int], _ k: Int) -> Int {

        var ans = 0
        let N = nums.count
        for start in 0..<N {
            var cur = 0
            for end in start..<N {
                if end == start {
                    cur = nums[end]
                } else {
                    cur = cur * nums[end] / gcd(cur, nums[end])
                }
                guard cur <= k else {break}
                if cur == k {
                    ans += 1
                }
            }
        }
        return ans
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}