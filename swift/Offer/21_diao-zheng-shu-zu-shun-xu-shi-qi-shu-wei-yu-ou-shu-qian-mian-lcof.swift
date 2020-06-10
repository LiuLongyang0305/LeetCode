// https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof/
class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        let N = nums.count
        var ans = nums
        var left = 0
        var right = N - 1
        
        while left < right {
            while left < right && nums[left] % 2 == 1 {
                left += 1
            }
            guard left < right else {
                break
            }
            while right > left && nums[right] % 2 == 0 {
                right -= 1
            }
            guard right > left else {
                break
            }
            ans.swapAt(left, right)
            left += 1
            right -= 1
        }
        return ans
    }
}