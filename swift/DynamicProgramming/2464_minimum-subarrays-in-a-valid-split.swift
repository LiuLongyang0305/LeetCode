//  https://leetcode.com/problems/minimum-subarrays-in-a-valid-split/
class Solution {
    private let INF = Int.max / 2
    func validSubarraySplit(_ nums: [Int]) -> Int {
        guard let f = nums.first, let l = nums.last, l != 1 && f != 1 else {return -1}
        let N = nums.count
        var memo = [Int:Int]()
        func dfs(_ from: Int) -> Int {
            guard from < N else {return 0}
            guard nums[from] != 1  else {
                return INF
            }
            if let c = memo[from] {
                return c
            }
            var ans = INF
            for possibleEnd in from..<N {
                let addNum = nums[possibleEnd]
                if gcd(nums[from], nums[possibleEnd]) > 1 {
                    ans = min(ans, 1 + dfs(possibleEnd + 1))
                }
            }
            memo[from] = ans
            return ans
        }


        let ans = dfs(0)
        return ans == INF ? -1 : ans
    }

    private func gcd(_ a: Int,_ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}