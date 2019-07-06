//https://leetcode.com/problems/array-partition-i/
class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var numsCopy = nums
        numsCopy.sort()
        var result = 0
        for i in 0..<(nums.count / 2) {
            result += numsCopy[2 * i]
        }
        return result
    }
}