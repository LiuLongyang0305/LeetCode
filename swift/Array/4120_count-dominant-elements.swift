    // https://leetcode.cn/problems/count-dominant-elements/
    class Solution {
        func countDominantElements(_ nums: [Int]) -> Int {
            guard nums.count > 1 else {return nums.count}
            var ans = 0
            let M = nums.count
            for (i,v) in nums.enumerated() {
                if i == 0 {
                    if v >= nums[1] {
                        ans += 1
                    }
                    continue
                }
                if i == M - 1 {
                    if v >= nums[i - 1] {
                        ans += 1
                    }
                    continue
                }
                if 2 * v >= nums[i - 1] + nums[i + 1] {
                    ans += 1
                }
            }
            return ans
        }
    }
