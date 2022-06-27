 // https://leetcode.com/problems/number-of-distinct-roll-sequences/
class Solution {

    private let MOD = 1_000_000_007
    func distinctSequences(_ n: Int) -> Int {

        var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: n), count: 7), count: 7)

        func dfs(_ ll: Int, _ l: Int,_ idx: Int) -> Int {
            guard idx < n else {return 1}

            guard -1 == memo[ll][l][idx] else {
                return memo[ll][l][idx]
            }
            var ans = 0

            for i in 1...6 {
                guard i != ll && i != l else {
                    continue
                }
                if l != 0 {
                    guard gcd(l, i) == 1 else {continue}
                }
                ans += dfs(l, i, idx + 1)
                ans %= MOD
            }

            memo[ll][l][idx] = ans
            return ans
        }
        return dfs(0, 0, 0)
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else {return a}
        return gcd(b, a % b)
    }

}