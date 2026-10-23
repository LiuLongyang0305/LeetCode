// https://leetcode.cn/problems/minimum-operations-to-make-the-array-beautiful/
class Solution {
    private let INF = 1_000_000_007
    func minOperations(_ nums: [Int]) -> Int {
        let N = nums.count
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: 105), count: N + 5)
        func dfs(_ idx:Int, _ val: Int) -> Int {
            guard idx < N else {return 0}
            if let v = memo[idx][val] {
                return v
            }
            var ans = INF

            let curVal = nums[idx]
            for j in stride(from: val, through: 100, by: val) {
                if j >= curVal {
                    ans = min(ans,j - curVal + dfs(idx + 1, j))
                }
                
            }
            memo[idx][val] = ans
            return ans
        }
        return dfs(1,nums[0])
    }
}
