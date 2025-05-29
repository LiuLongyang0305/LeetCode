// https://leetcode.cn/problems/visit-array-positions-to-maximize-score/
class Solution {
    private let INF = 1_000_000_000_007
    //奇数，偶数下标转移过来
    private typealias Pair = (odd:Int,even: Int)
    func maxScore(_ nums: [Int], _ x: Int) -> Int {
        let N = nums.count
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: 2), count: N + 5)
        func dfs(_ cur: Int, _ mod: Int) -> Int {
            guard cur < N else {return 0}
            if let v = memo[cur][mod] {return v}
            //如果不选cur
            var ans = dfs(cur + 1, mod)
            //如果选，考虑奇偶性
            if nums[cur] & 1 == mod {
                ans = max(ans, nums[cur] + dfs(cur + 1, mod))
            } else {
                ans = max(ans,nums[cur] + dfs(cur + 1, 1 - mod) - x)
            }
            memo[cur][mod] = ans
            return ans
        }


        return nums[0] + dfs(1, nums[0] & 1)
    }
}
