    //https://leetcode.cn/problems/delayed-count-of-equal-elements/
    class Solution {
        func delayedCount(_ nums: [Int], _ k: Int) -> [Int] {
            var cnt = [Int:Int]()
            for num in nums.dropFirst(k) {
                cnt[num,default: 0] += 1
            }
            let M = nums.count
            var ans = [Int](repeating: 0, count: nums.count)
            for (i, v) in nums.enumerated() {
                let j = i + k
                if j < M {
                    cnt[nums[j],default: 0] -= 1
                }
                ans[i] = (cnt[nums[i]] ?? 0)
            }
            return ans
        }
    }
