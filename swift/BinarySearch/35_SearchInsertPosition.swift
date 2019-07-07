class Q35_Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if target <= nums[0] || nums.isEmpty {
            return 0
        }
        if target > nums.last! {
            return nums.count
        }
        var left = 0
        var right = nums.count
        while left < right - 1 {
            let middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            } else if nums[middle] < target {
                left = middle
            } else {
                right = middle
            }
        }
        return left + 1
    }
}