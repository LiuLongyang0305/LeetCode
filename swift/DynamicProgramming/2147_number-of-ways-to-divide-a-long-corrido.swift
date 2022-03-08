//https://leetcode.com/problems/number-of-ways-to-divide-a-long-corridor/
class Solution1 {
    private let MOD = 1_000_000_007
    func numberOfWays(_ corridor: String) -> Int {
        
        let N = corridor.count
        var preffix = [0]
        corridor.forEach {preffix.append(preffix.last! + ($0 == "S" ? 1 : 0))}
        guard preffix.last! > 0 && preffix.last! % 2 == 0 else {return 0}
        var memo = [Int](repeating: 0, count: N + 1 )
        
        func dfs(_ start: Int) -> Int {
            
            guard preffix.last! - preffix[start - 1] > 2 else {return 1}
            guard memo[start] == 0 else {return memo[start]}
            
            var end = start + 1
            while  end <= N && preffix[end] - preffix[start - 1] < 2 {
                end += 1
            }
            
            
            let last = end
            let curSum = preffix[end]
            while preffix[end] == curSum {
                end += 1
            }
            let ans = (end - last) * dfs(end) % MOD
            memo[start] = ans
            return ans
        }
        return dfs(1)
    }
}
class Solution {
    private let MOD = 1_000_000_007
    func numberOfWays(_ corridor: String) -> Int {
        var sofas = [Int]()
        var idx = 0
        corridor.forEach { ch in
            if ch == "S" {
                sofas.append(idx)
            }
            idx += 1
        }
        
        guard !sofas.isEmpty && sofas.count % 2 == 0 else {
            return 0
        }
        
        let M = sofas.count
        var ans = 1
        var i = 2
        while i < M {
            ans *= (sofas[i] - sofas[i - 1])
            ans %= MOD
            i += 2
        }
        
        return ans
    }
}