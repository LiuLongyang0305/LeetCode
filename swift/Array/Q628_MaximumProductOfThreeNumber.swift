//https://leetcode.com/problems/maximum-product-of-three-numbers/
class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        if nums.count == 3 {
            return nums[0] * nums[1] * nums[2]
        }
        var numbers = nums
        numbers.sort()
        let size = numbers.count
        if numbers.last! <= 0 || numbers[0] >= 0{
            return numbers[size - 1] * numbers[size - 2] * numbers[size - 3]
        } else {
            let left = numbers[0] * numbers[1] * numbers.last!
            let  right = numbers[size - 1] * numbers[size - 2] * numbers[size - 3]
            return max(left, right)
        }
    }
}