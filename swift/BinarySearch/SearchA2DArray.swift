//https://leetcode.com/problems/search-a-2d-matrix/
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var nums = [Int]()
        for ele in matrix {
            nums.append(contentsOf: ele)
        }
        guard !nums.isEmpty else {
            return false
        }
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if nums[mid] == target {
                return true
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return nums[left] == target
    }
}