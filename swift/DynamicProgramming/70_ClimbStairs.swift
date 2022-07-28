class Q70_Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        } else {
            var oneStepBefore = 2
            var twoStepBefore = 1
            for _ in 3...n {
                let temp = oneStepBefore + twoStepBefore
                twoStepBefore = oneStepBefore
                oneStepBefore = temp
            }
            return oneStepBefore
        }
    }
}

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var memo = [Int](repeating: -1, count: n + 5)
        func dfs(_ stairs: Int) -> Int {
            if 1 == stairs {
                return 1
            }
            if 2 == stairs {
                return 2
            }
            guard -1 == memo[stairs] else {
                return memo[stairs]
            }

            let ans = dfs(stairs - 1) + dfs(stairs - 2)
            memo[stairs] = ans
            return ans
        }
        return dfs(n)
    }
}