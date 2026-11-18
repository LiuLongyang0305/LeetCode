    // https://leetcode.cn/problems/count-consistent-subarrays-i/
    class Solution {
        func countConsistent(_ nums: [Int]) -> Int {
            let M = nums.count
            var ans = 0
            for i in 0..<M {
                var t = nums[i]
                var minEle = nums[i]
                var j = i
                while j < M {
                    t = t & nums[j]
                    minEle = min(minEle,nums[j])
                    if t == minEle {
                        ans += 1
                    }
                    j += 1
                }
            }
            return ans
        }
    }
