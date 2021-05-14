// https://leetcode.com/problems/maximum-subarray-min-product/
class Solution {
    func maxSumMinProduct(_ nums: [Int]) -> Int {
        var ans = 0
        var preffix = [0]
        for num in nums {
            preffix.append(preffix.last! + num)
        }
        var stack = [Int]()
        for i in 0...nums.count {
            while !stack.isEmpty && (i == nums.count || nums[stack.last!] > nums[i]) {
                let j = stack.removeLast()
                ans = max(ans, nums[j] * (preffix[i] - preffix[stack.isEmpty ? 0 : stack.last! + 1]))
            }
            stack.append(i)
        }
        return ans % 1_000_000_007
    }
}

