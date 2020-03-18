// https://leetcode.com/problems/split-array-largest-sum/
class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        let N = nums.count
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max, count: m + 1), count: N + 1)
        var prefix = Array<Int>(repeating: 0, count: N + 1)
        for i in 0..<N {
            prefix[i + 1] = prefix[i] + nums[i]
        }
        ans[0][0] = 0
        for i in 1...N {
            for j in 1...m {
                for k in 0..<i {
                    ans[i][j] = min(ans[i][j], max(ans[k][j - 1], prefix[i] - prefix[k]))
                }
            }
        }
        return ans[N][m]
    }
}