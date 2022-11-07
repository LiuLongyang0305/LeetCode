// https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k/
class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var cnt = [Int:Int]()
        let N = nums.count
        var sum = 0
        var right = 0
        var ans = Int.min
        while right < k {
            sum += nums[right]
            cnt[nums[right],default: 0] += 1
            right += 1
        }
        if cnt.count == k {
            ans = max(ans, sum)
        }
        var left = 0
        while right < N {
            sum += nums[right] - nums[left]
            cnt[nums[right],default: 0] += 1
            if let c = cnt[nums[left]] {
                if c == 1 {
                    cnt.removeValue(forKey: nums[left])
                } else {
                    cnt[nums[left]] = c - 1
                }
            }
            if cnt.count == k {
                ans = max(ans, sum)
            }
            left += 1
            right += 1
        }

        return max(ans, 0)
    }
}