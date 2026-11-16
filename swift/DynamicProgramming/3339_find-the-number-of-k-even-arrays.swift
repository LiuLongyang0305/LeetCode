//https://leetcode.cn/problems/find-the-number-of-k-even-arrays/
class Solution {
    private let MOD = 1_000_000_007
    private struct Key:Hashable {
        var i: Int
        var curTotal:Int
        var isPreEven:Bool
    }
    func countOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        let odds = (m + 1) / 2
        let evens = m - odds

        var memo = [Key:Int]()
        func dfs(_ i: Int, _ curTotal: Int, _ isPreEven: Bool) -> Int {
            guard i < n else {
                return curTotal == k ? 1 : 0
            }
            guard curTotal <= k else {return 0}
            let key = Key(i: i, curTotal: curTotal, isPreEven: isPreEven)
            if let v = memo[key] {return v}
            var sb = 0
            if isPreEven {
                sb =  (evens * dfs(i + 1, curTotal + 1, true) % MOD + odds * dfs(i + 1, curTotal, false) % MOD) % MOD
            } else {
                sb = (evens * dfs(i + 1, curTotal, true) % MOD + odds * dfs(i + 1, curTotal, false) % MOD) % MOD
            }
            memo[key] = sb
            return sb
        }
        let res = dfs(0, 0, false)
        return res % MOD
    }
}

