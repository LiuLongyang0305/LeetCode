    // https://leetcode.cn/problems/valid-subarrays-with-matching-sum-digits-ii/description/
    class Solution {
        func countValidSubarrays(_ nums: [Int], _ x: Int) -> Int {
            let M = nums.count
            var ps = [Int](repeating: 0, count: M + 1)
            for (i,v) in nums.enumerated() {
                ps[i + 1] = ps[i] + v
            }
            var ans = 0
            var low = x
            var high = x + 1
            while low <= ps[M] {
                var cnt = [Int](repeating: 0, count: 10)
                var left1 = 0
                var left2 = 0
                for s in ps {
                    while ps[left1] <= s - high {
                        cnt[ps[left1] % 10] -= 1
                        left1 += 1
                    }
                    while ps[left2] <= s - low {
                        cnt[ps[left2] % 10] += 1
                        left2 += 1
                    }
                    ans += cnt[(s - x + 10) % 10]
                }
                low *= 10
                high *= 10
            }
            return ans
        }
    }
