//https://leetcode.com/problems/handshakes-that-dont-cross/
class Solution {

    private let MOD = 1_000_000_007
    func numberOfWays(_ numPeople: Int) -> Int {

        var memo = [Int](repeating: -1, count: numPeople + 5)
        func dfs(_ cnt: Int) -> Int {

            guard cnt % 2 == 0 else {
                return 0
            }

            if cnt == 2 || cnt == 0 {
                return 1
            }

            guard -1 == memo[cnt] else {return memo[cnt]}
            var ans = 0

            for j in 2...cnt {
                ans += dfs(j - 2) * dfs(cnt - j)
                ans %= MOD
            }

            memo[cnt] = ans
            return ans
        }


        return dfs(numPeople)
    }
}