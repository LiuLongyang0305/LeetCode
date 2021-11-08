// https://leetcode.com/problems/smallest-index-with-equal-value/
class Solution {
    func smallestEqual(_ nums: [Int]) -> Int {
        let N = nums.count
        for i in 0..<N {
            if i % 10 == nums[i] {
                return i
            }
        }
        return -1
    }
}

