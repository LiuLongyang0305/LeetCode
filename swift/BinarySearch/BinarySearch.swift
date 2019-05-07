class Q704_Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let length = nums.count
        guard target >= nums[0] && target <= nums[length - 1] else {
            return -1
        }
        var left = 0
        var right = length - 1
        while left < right {
            let middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            } else if nums[middle] > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        if left == right {
            if nums[left] == target {
                return left
            }
        }
        return -1
    }
}