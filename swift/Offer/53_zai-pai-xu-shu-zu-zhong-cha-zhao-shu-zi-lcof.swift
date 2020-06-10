// https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var ans = [-1,-1]
        guard !nums.isEmpty else {
            return ans
        }
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if nums[mid] >= target  {
                right = mid
            } else {
                left = mid + 1
            }
        }
        guard nums[left] == target else {
            return ans
        }
        ans[0] = left
        while left < nums.count && nums[left] == target {
            left += 1
        }
        if left == nums.count {
            ans[1] = nums.count - 1
        } else {
            ans[1] =  nums[left] == target ? left : (left - 1)
        }
        return ans
    }
    func search(_ nums: [Int], _ target: Int) -> Int {
        let range = searchRange(nums,target)
        return range[0] == -1 ? 0 : (range[1] - range[0] + 1)
    }
}