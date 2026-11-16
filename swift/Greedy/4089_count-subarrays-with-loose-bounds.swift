    // https://leetcode.cn/problems/count-subarrays-with-loose-bounds/
    class Solution {
        func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
            var ans = 0
            let M = nums.count
            var i = 0
            while i < M {
                var j = i
                while j < M && nums[j] >= minK && nums[j] <= maxK {
                    j += 1
                }
                let length = j - i
                ans += (length + 1) * length / 2
                i = j + 1
            }


            return ans
        }
    }
