// https://leetcode.com/problems/number-of-subarrays-with-gcd-equal-to-k/
class Solution {
    func subarrayGCD(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        let N = nums.count
        for left in 0..<N {
            guard nums[left] % k == 0 else {continue}
            var right = left
            var curGcd = nums[left]
            while right < N && curGcd % k == 0 {
                curGcd = gcd(curGcd, nums[right])
                if curGcd == k {
                    ans += 1
                }
                right += 1
            }


        }
        return ans
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}