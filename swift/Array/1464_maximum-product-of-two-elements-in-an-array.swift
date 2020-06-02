// https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var first: Int = min(nums[0], nums[1])
        var second: Int = max(nums[0], nums[1])
        let N = nums.count
        for i in 2..<N {
            if nums[i] >= second {
                first = second
                second = nums[i]
            } else {
                if nums[i] > first {
                    first = nums[i]
                }
            }
        }
        return (second - 1) * (first - 1)
    }
}

