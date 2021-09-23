// https://leetcode.com/problems/sum-of-beauty-in-the-array/
class Solution {
    func sumOfBeauties(_ nums: [Int]) -> Int {
        let M = nums.count
        var ans = 0
        var preffix = [Int](repeating: 0, count: M + 1)
        var suffix = [Int](repeating: Int.max, count: M + 1)
        (0..<M).forEach { preffix[$0 + 1] = max(preffix[$0], nums[$0])}
        for i in stride(from: M - 1, through: 0, by: -1) {
            suffix[i] = min(suffix[i + 1], nums[i])
        }
        for i in 1...(M - 2) {
            if nums[i] > preffix[i] && nums[i] < suffix[i + 1] {
                ans += 2
            } else if nums[i] > nums[i - 1] && nums[i] < nums[i + 1] {
                ans += 1
            }
        }
        return ans
    }
}