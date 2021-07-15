// https://leetcode.com/problems/kth-smallest-subarray-sum/
class Solution {
    func kthSmallestSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var right = nums.reduce(0) { $0 + $1}
        var left = nums.min()!
        while left < right {
            let mid = (left + right) >> 1
            if check(nums, mid, k) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    private func check(_ nums: [Int], _ limit: Int, _ k: Int ) -> Bool {
        var cnt = 0
        var left = 0       
        var right = 0
        let N = nums.count
        var sum = 0
        while right < N {
            sum += nums[right]
            while sum > limit {
                sum -= nums[left]
                left += 1
            }
            cnt += right - left + 1
            right += 1
        }
        return cnt >= k
    }
}