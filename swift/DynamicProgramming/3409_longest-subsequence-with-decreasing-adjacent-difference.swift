//https://leetcode.com/problems/longest-subsequence-with-decreasing-adjacent-difference/
class Solution {
    func longestSubsequence(_ _nums: [Int]) -> Int {
        let N = _nums.count
        //memo[i][j]:以i结尾，绝对值差在0~j之间的最
        var memo = [[Int]](repeating: [Int](repeating: 0, count: 305), count: 305)
        let nums = _nums.reversed()
        for num in nums {
            for pre in 1...300 {
                let dif = abs(num - pre)
                memo[num][dif] = max(memo[num][dif], memo[pre][dif] + 1)
            }
            for diff in 1...300 {
                memo[num][diff] = max(memo[num][diff],memo[num][diff - 1])
            }
        }


        var ans = 0
        for i in 0...300 {
            for j in 0...300 {
                ans = max(ans,memo[i][j])
            }
        }
        return ans
    }
}
