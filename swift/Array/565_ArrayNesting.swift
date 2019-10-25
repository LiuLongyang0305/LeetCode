//https://leetcode.com/problems/array-nesting/
class Solution {
    func arrayNesting(_ nums: [Int]) -> Int {
        var visited = Array<Bool>(repeating: false, count: nums.count)
        var ans = 0
        for i in 0..<nums.count {
            if !visited[i] {
                var length = 0
                var j = i
                while !visited[j] {
                    length +=  1
                    visited[j] = true
                    j = nums[j]
                }
                ans = max(ans, length)
            }
        }
        return ans
    }
}