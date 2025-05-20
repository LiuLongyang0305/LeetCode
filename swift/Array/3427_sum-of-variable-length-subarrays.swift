// https://leetcode.com/problems/sum-of-variable-length-subarrays/description/
class Solution {
    func subarraySum(_ nums: [Int]) -> Int {
        var pre = [0]
        var s = 0
        for num in nums {
            s += num
            pre.append(s)
        }
        var ans = 0
        for i in 0..<nums.count {
            let s = max(0,i - nums[i])
            ans += pre[i + 1] - pre[s]
        }
        return ans
    }
}