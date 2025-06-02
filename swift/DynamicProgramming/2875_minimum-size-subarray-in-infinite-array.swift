//https://leetcode.cn/problems/minimum-size-subarray-in-infinite-array/
class Solution {
    func minSizeSubarray(_ nums: [Int], _ target: Int) -> Int {
        let total = nums.reduce(0) { $0 + $1}
        let minLength = getMinLength(of: target % total, in: nums + nums)
        return minLength == -1 ? -1 : (target / total * nums.count + minLength)
    }

    private func  getMinLength(of target: Int, in nums: [Int]) -> Int {
        if target == 0 {return 0}
        var ans = nums.count
        var memo = [Int:Int]()
        memo[0] = -1
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            if let idx = memo[sum - target] {
                ans = min(ans,i - idx)
            }
            memo[sum] = i
        }

        return ans == nums.count ? -1 : ans
    }
}
