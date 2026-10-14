    // https://leetcode.cn/problems/longest-semi-repeating-subarray/
    class Solution {
        func longestSubarray(_ nums: [Int], _ k: Int) -> Int {
            var cnt = [Int:Int]()
            var temp = 0
            var l = 0
            var ans = 0

            for (r,x) in nums.enumerated() {
                cnt[x,default: 0] += 1
                if cnt[x]! == 2 {
                    temp += 1
                }
                while temp > k {
                    cnt[nums[l],default: 0] -= 1
                    if cnt[nums[l]]! == 0 {
                        cnt.removeValue(forKey: nums[l])
                    }
                    if (cnt[nums[l]] ?? 0) == 1 {
                        temp -= 1
                    }
                    l += 1
                }
                ans = max(ans,r - l + 1)
            }
            return ans
        }
    }
