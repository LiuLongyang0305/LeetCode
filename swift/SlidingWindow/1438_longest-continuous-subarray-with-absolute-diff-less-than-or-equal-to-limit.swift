// https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/
class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        let N = nums.count
        var maxd = [Int]()
        var mind = [Int]()
        var i = 0;
        var j = 0;
        while j < N {
            while !maxd.isEmpty && nums[j] > maxd.last! {
                maxd.popLast()
            }
            while !mind.isEmpty && nums[j] < mind.last! {
                mind.popLast()
            }
            maxd.append(nums[j])
            mind.append(nums[j])
            if let curMax = maxd.first, let curMin = mind.first, curMax - curMin > limit {
                if curMin == nums[i] {
                    mind.removeFirst()
                }
                if curMax == nums[i] {
                    maxd.removeFirst()
                }
                i += 1
            }
            j += 1
        }
        return j - i
    }
}


