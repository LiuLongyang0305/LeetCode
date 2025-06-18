//https://leetcode.com/problems/maximize-total-cost-of-alternating-subarrays
class Solution {
    func maximumTotalCost(_ nums: [Int]) -> Int {

        let N = nums.count
        var memo = [Int?](repeating: nil, count: N)
        func dfs(_ i: Int) -> Int {
            guard i < N else {return 0}
            if let v = memo[i] {
                return v
            }
            //i可以单开，可以和接下来两个一起
            var ans = nums[i] + dfs(i + 1)
            if i + 1 < N {
                ans = max(ans,nums[i] - nums[i + 1] + dfs(i + 2))
            }
            memo[i] = ans
            return ans
        }


        return dfs(0)
    }
}
