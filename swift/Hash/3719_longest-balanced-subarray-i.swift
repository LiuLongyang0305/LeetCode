//https://leetcode.cn/problems/longest-balanced-subarray-i/
class Solution {
    func longestBalanced(_ nums: [Int]) -> Int {
        let M = nums.count
        var sb = 0
        for i in 0..<M {
            var j = i
            var oddSet = Set<Int>()
            var evenSet = Set<Int>()
            while j < M {
                if nums[j] & 1 == 0 {
                    oddSet.insert(nums[j])
                } else {
                    evenSet.insert(nums[j])
                }
                if evenSet.count == oddSet.count {
                    sb = max(sb,j - i + 1)
                }
                j += 1
            }
        }
        return sb
    }
}
