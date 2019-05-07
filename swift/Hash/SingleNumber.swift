//https://leetcode.com/problems/single-number/
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result : Int = nums[0]
        for num in nums[1...] {
            result ^= num
        }
        return result
    }
}