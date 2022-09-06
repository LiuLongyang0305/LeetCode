// https://leetcode.com/problems/number-of-ways-to-reach-a-position-after-exactly-k-steps/
class Solution {
    private let MOD = 1_000_000_007
    func numberOfWays(_ _startPos: Int, _ _endPos: Int, _ k: Int) -> Int {

        let startPos = 0
        let endPos = _endPos - _startPos
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: 1005), count: 2010)
        func dfs(_ cur: Int, _ step: Int) -> Int {

            let t = abs(cur - endPos)
            if t == step {
                return 1
            }
            if t > step {
                return 0
            }
            if let c = memo[cur + 1005][step] {
                return c
            }
            let ans = (dfs(cur - 1, step - 1)  + dfs(cur + 1, step - 1)) % MOD
            memo[cur + 1005][step] = ans
            return ans
        }



        return dfs(startPos, k)
    }
}
