//https://leetcode.com/problems/length-of-the-longest-subsequence-that-sums-to-targe


class Solution {
    private let INF = 1_000_000_007
    func lengthOfLongestSubsequence(_ nums: [Int], _ target: Int) -> Int {


        let N = nums.count

        var memo =  [[Int?]](repeating: [Int?](repeating: nil, count: 1005), count: 1005)
        func dfs(_ cur: Int, _ goal: Int) -> Int {

            guard goal > 0 else {return 0}
            guard cur < N else {return -INF}
            if let v = memo[cur][goal] {
                return v
            }
            var ans = -INF
            //选
            if nums[cur] <= goal {
                ans = max(ans,1 + dfs(cur + 1, goal - nums[cur]))
            }

            //不选
            ans = max(ans, dfs(cur + 1, goal))
            memo[cur][goal] = ans
            return ans
        }


        let ans = dfs(0, target)

        return ans < 0 ? -1 : ans
    }
}
