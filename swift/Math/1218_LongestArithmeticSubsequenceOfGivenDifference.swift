//https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/
class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var ans = 1
        var map = [Int: Int]()
        for num in arr {
            let target = num - difference
            if let c = map[target] {
                map[num] = c + 1
                ans = max(ans, c + 1)
            } else {
                map[num] = 1
            }
        }
        return ans
    }
}