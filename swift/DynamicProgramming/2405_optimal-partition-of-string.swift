// https://leetcode.com/problems/optimal-partition-of-string/
class Solution {
    func partitionString(_ s: String) -> Int {
        let charsOrderInAlphabet = s.map { Int($0.asciiValue ?? 0) - 97}
        let N = s.count

        var memo = [Int](repeating: -1, count: N)
        func dfs(_ idx: Int) -> Int {
            guard idx < N else {
                return 0
            }
            guard -1 == memo[idx] else {return memo[idx]}
            var ans = Int.max
            var mask = 0
            var delta = 0
            while delta < 26 && idx + delta < N {
                guard mask & (1 << charsOrderInAlphabet[idx + delta]) == 0 else {
                    break
                }
                ans = min(ans, 1 + dfs(idx + delta + 1))
                mask |= (1 << charsOrderInAlphabet[idx + delta])
                delta += 1
            }
            memo[idx] = ans
            return ans
        }


        return  dfs(0)
    }
}