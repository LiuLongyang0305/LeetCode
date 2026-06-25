//https://leetcode.cn/problems/count-good-integers-in-a-range/
class Solution {
    func goodIntegers(_ l: Int, _ r: Int, _ k: Int) -> Int {
        return calc(r, k) - calc(l - 1, k)
    }

    func calc(_ n: Int, _ k: Int) -> Int {
        let s = Array(String(n).map { Int(String($0))! })
        var memo = [String:Int]()

        func dfs(_ i: Int, _ last: Int, _ tight: Bool, _ started: Bool) -> Int {
            if i == s.count { return started ? 1 : 0 }
            let key = "\(i)-\(last)-\(tight)-\(started)"
            if let v = memo[key] { return v }

            let limit = tight ? s[i] : 9
            var res = 0

            for d in 0...limit {
                let ntight = tight && d == limit
                if !started && d == 0 {
                    res += dfs(i+1, -1, ntight, false)
                } else if last == -1 || abs(d-last) <= k {
                    res += dfs(i+1, d, ntight, true)
                }
            }

            memo[key] = res
            return res
        }

        return dfs(0, -1, true, false)
    }
}
