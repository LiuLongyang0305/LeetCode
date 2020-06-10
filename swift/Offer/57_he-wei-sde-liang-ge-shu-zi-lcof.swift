// https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof/
class Solution {
    func twoSum(_ nums: [Int], _ sum: Int) -> [Int] {
        let N = nums.count
        guard N >= 2 else {
            return []
        }
        func binarySearch(_ target: Int) -> Bool {
            guard target >= nums[0] && target <= nums[N - 1] else {
                return false
            }
            var left = 0
            var right = N - 1
            while left < right {
                let mid = left + (right - left) >> 1
                if nums[mid] == target {
                    return true
                } else if nums[mid] > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            return nums[left] == target
        }
        for i in 0..<N {
            let target = sum - nums[i]
            if binarySearch(target) {
                return [nums[i],target]
            }
        }
        return []
    }
}