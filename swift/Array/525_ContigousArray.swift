//https://leetcode.com/problems/contiguous-array
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var ans = 0
        var count = 0
        var countFirstIndex = [Int: Int]()
        countFirstIndex[0] = -1
        for i in 0..<nums.count {
            count += nums[i] == 1  ?  1 : -1
            if let index = countFirstIndex[count]{
                ans = max(ans, i  - index)
            } else {
                countFirstIndex[count] = i
            }
        }
        return ans
    }
}