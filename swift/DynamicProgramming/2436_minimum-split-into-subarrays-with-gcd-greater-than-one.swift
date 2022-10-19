// https://leetcode.com/problems/minimum-split-into-subarrays-with-gcd-greater-than-one/
class Solution {
    func minimumSplits(_ nums: [Int]) -> Int {

        let N = nums.count

        var memo = [Int?](repeating: nil, count: N + 5)
        func dfs(_ idx: Int) -> Int {
            guard idx < N else {return 0}
            if let res = memo[idx] {
                return res
            }
            var ans = Int.max
            var curGcd = nums[idx]
            var i = idx
            while i < N {
                curGcd = gcd(curGcd, nums[i])
                guard curGcd > 1 else {
                    break
                }
                ans = min(ans, 1 + dfs(i + 1))
                i += 1
            }
            memo[idx] = ans
            return ans
        }



        return dfs(0)
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}