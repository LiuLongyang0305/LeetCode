//https://leetcode.com/problems/next-greater-element-ii/
class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let length = nums.count
        var ans = Array<Int>(repeating: -1, count: length)
        var stack = Array<Int>()
        for i in 0..<(2 * length) {
            let index = i % length
            while !stack.isEmpty && nums[stack.last!] < nums[index] {
                ans[stack.removeLast()] = nums[index]
            }
            if ans[index] == -1 {
                stack.append(index)
            }
        }
        return ans
    }
}