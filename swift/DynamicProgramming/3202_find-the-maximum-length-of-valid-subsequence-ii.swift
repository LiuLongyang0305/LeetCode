//https://leetcode.com/problems/find-the-maximum-length-of-valid-subsequence-ii/
class Solution {
    func maximumLength(_ nums: [Int], _ K: Int) -> Int {
        let newNums = nums.map { $0 % K}
        let N = nums.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: K + 5), count: K + 5)
        var ans = 1
        for x in newNums {
            for y in 0..<K{
                dp[y][x] = dp[x][y] + 1
                ans = max(ans,dp[y][x])
            }
        }
        return ans
    }
}
