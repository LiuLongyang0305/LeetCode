// https://leetcode.com/problems/maximize-the-topmost-element-after-k-moves/
class Solution {
    func maximumTop(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return k & 1 == 0 ? nums[0] : -1
        }
        var ans = 0
        let N = nums.count
        var i = 0
        while i < N && i + 1 < k {
            ans = max(ans,nums[i])
            i += 1
        }
        if k < N {
            ans = max(ans, nums[k])
        }
        return ans
    }
}