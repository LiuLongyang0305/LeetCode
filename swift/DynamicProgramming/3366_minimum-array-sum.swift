// https://leetcode.cn/problems/minimum-array-sum/
class Solution {
    func minArraySum(_ nums: [Int], _ k: Int, _ op1: Int, _ op2: Int) -> Int {
        let N = nums.count


        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: op2 + 5), count: op1 + 5), count: N + 5)

        func dfs(_ idx: Int, _ remainOp1: Int, _ remainOp2:Int ) -> Int {

            guard idx < N else {return 0}
            if let v = memo[idx][remainOp1][remainOp2] {
                return v
            }
            var ans = dfs(idx + 1, remainOp1, remainOp2)
            //op1
            if remainOp1 > 0 {
                ans = max(ans,  (nums[idx]  + (nums[idx] & 1 == 0 ? 0 : -1)) / 2   + dfs(idx + 1, remainOp1 - 1, remainOp2))
            }
            //op2
            if remainOp2 > 0 && nums[idx] >= k {
                ans = max(ans, k + dfs(idx + 1, remainOp1, remainOp2 - 1))
            }

            //先op1再op2
            if remainOp1 > 0 && remainOp2 > 0 {
                let remainNum = (nums[idx] + (nums[idx] & 1 == 0 ? 0 : 1)) / 2
                if remainNum >= k {
                    ans = max(ans,k + nums[idx] - remainNum + dfs(idx + 1, remainOp1 - 1, remainOp2 - 1))
                }
                    //先op2再op1
                if nums[idx] >= k {
                    let remainNum2 = nums[idx] - k
                    let delta = k + (remainNum2 + (remainNum2 & 1 == 0 ? 0 : -1)) / 2
                    ans = max(ans,delta + dfs(idx + 1, remainOp1 - 1, remainOp2 - 1))
                }
            }
             memo[idx][remainOp1][remainOp2] = ans
            return ans
        }

        return nums.reduce(0) {$0 + $1} - dfs(0, op1, op2)
    }
}
