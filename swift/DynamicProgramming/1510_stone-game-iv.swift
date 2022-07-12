// https://leetcode.com/problems/stone-game-iv/
class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dp = Array<Bool>(repeating: false, count: n + 1)
        for i in 1...n {
            var j = 1
            while j * j <= i {
                if !dp[i - j * j] {
                    dp[i] = true
                    break
                }
                j += 1
            }
        }
        return dp[n]
    }
}

 // https://leetcode.com/problems/stone-game-iv/
class Solution {
    let squeres = (1...316).map { $0 * $0}
    let squeresSet = Set<Int>((1...316).map { $0 * $0})
    func winnerSquareGame(_ n: Int) -> Bool {

        var memo = [Bool?](repeating: nil, count: n + 2)
        func dfs(_ remain: Int) -> Bool {

            guard !squeresSet.contains(remain) else {
                return true
            }

            if let v = memo[remain] {
                return v
            }

            var ans = false
            for squre in squeres {
                guard squre < remain else {
                    break
                }
                ans = !dfs(remain - squre)
                guard !ans else {
                    break
                }
            }

            memo[remain] = ans
            return ans
        }


        return dfs(n)
    }
}