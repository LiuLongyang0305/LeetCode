//https://leetcode.com/problems/subarray-product-less-than-k/
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else {
            return 0
        }
        var ans = 0
        var product = 1
        var left = 0
        for right in 0..<nums.count {
            product *= nums[right]
            while product >= k {
                product /=  nums[left]
                left  += 1
            }
            ans += right - left + 1
        }
        return  ans
    }
}