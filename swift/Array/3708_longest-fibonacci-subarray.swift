// https://leetcode.cn/problems/longest-fibonacci-subarray/
class Solution {
    func longestSubarray(_ nums: [Int]) -> Int{
        guard nums.count > 2 else {return nums.count}
        var pre = [-1,-1]
        for i in 2..<nums.count {
            pre.append(nums[i]  - nums[i - 1] - nums[i - 2]  == 0 ? 0 : -1)
        }
        // print(pre)
        var pre2 = [0]
        for  num in pre {
            if num != 0 {
                pre2.append(0)
            }
            else {
                pre2.append(pre2.last! + 1)
            }
        }
        // print(pre2)
        return pre2.max()! + 2
    }
}
