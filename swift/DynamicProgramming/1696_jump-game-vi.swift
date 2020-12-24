// https://leetcode.com/problems/jump-game-vi/
class Solution {
    func maxResult(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        guard nums.count > 1 else {
            return nums[0]
        }

        var dp = [nums[0]]
        var maxIdx = 0

        for idx in 1..<N {
            if maxIdx < idx - k {
                maxIdx = idx - k
                for i in (idx - k)..<idx {
                    if dp[i] >= dp[maxIdx] {
                        maxIdx = i
                    }
                }
            }
            dp.append(dp[maxIdx] + nums[idx])
            if dp[maxIdx] <= dp[idx] {
                maxIdx = idx
            }
//            print("dp = \(dp)  max = \(dp[maxIdx])")
        }
        return dp[N - 1]
    }
}