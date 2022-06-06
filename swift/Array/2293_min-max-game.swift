// https://leetcode.com/problems/min-max-game/
class Solution {
    func minMaxGame(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums[0]
        }
        let N = nums.count >> 1
        var newNumbers = [Int](repeating: -1, count: N)
        var i = 0
        while i < N {
            if i & 1 == 0 {
                newNumbers[i] = min(nums[i << 1], nums[i << 1 | 1])
            } else {
                newNumbers[i] = max(nums[i << 1], nums[i << 1 | 1])
            }
            i += 1
        }
        return minMaxGame(newNumbers)
    }
}