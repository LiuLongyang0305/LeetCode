 // https://leetcode.cn/problems/minimum-subarray-length-with-distinct-sum-at-least-k/
    class Solution {
        func minLength(_ nums: [Int], _ k: Int) -> Int {
            let M = nums.count
            var sb = M + 1

            var left = 0
            var right = 0
            var sum = 0
            var cnt = [Int:Int]()

            while left < M {
                while right < M && sum < k {
                    if let v = cnt[nums[right]] {
                        cnt[nums[right]] = v + 1
                    } else {
                        cnt[nums[right]] = 1
                        sum += nums[right]
                    }
                    right += 1
                }

                if sum >= k {
                    sb = min(sb,right - left)
                }

                if let v = cnt[nums[left]] {
                    if v == 1 {
                        sum -= nums[left]
                        cnt.removeValue(forKey: nums[left])
                    } else {
                        cnt[nums[left]] = v - 1
                    }
                }

                left += 1
            }


            return sb > M ? -1 : sb
        }
    }
