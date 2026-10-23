    // https://leetcode.cn/problems/reverse-k-subarrays/
    class Solution {
        func reverseSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
            let segLength = nums.count / k

            var ans = [Int]()
            for i in 0..<k {
                let l = i * segLength
                let r = (i + 1) * segLength
                ans += [Int](nums[l..<r].reversed())
            }
            return ans
        }
    }
