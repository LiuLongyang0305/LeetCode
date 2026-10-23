    // https://leetcode.cn/problems/maximum-number-of-matching-indices-after-right-shifts/
    class Solution {
        func maximumMatchingIndices(_ nums1: [Int], _ nums2: [Int]) -> Int {
            let nums = nums1 + nums1
            let N = nums1.count
            var ans = 0
            for i in 0..<N {
                var cnt = 0
                for j in 0..<N {
                    if nums[i + j] == nums2[j] {
                        cnt += 1
                    }
                }
                ans = max(ans,cnt)
                if ans == N {
                    break
                }
            }
            return ans
        }
    }
