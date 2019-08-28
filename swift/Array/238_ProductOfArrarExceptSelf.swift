//https://leetcode.com/problems/product-of-array-except-self/
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var ans = Array<Int>(repeating: 1, count: nums.count)
        var product = 1
        for i in 0..<nums.count {
            ans[i] = product
            product *= nums[i]
        }
        product = 1
        for i in (0..<nums.count).reversed() {
            ans[i] *= product
            product *= nums[i]
        }
        return ans
    }
}