    // https://leetcode.cn/problems/minimum-cost-to-partition-a-binary-string/
class Solution {
    func minCost(_ s: String, _ encCost: Int, _ flatCost: Int) -> Int {
        let chars = [Character](s)
        let N = chars.count
        var preffix = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            preffix[i + 1] = preffix[i] + (chars[i] == "1" ? 1 : 0)
        }


        func dfs(_ l: Int, _ r: Int) -> Int {
            let x = preffix[r] - preffix[l]
            var sb = x > 0 ? (r - l) * x * encCost : flatCost
            if (r - l) % 2 == 0 {
                let m = (l + r) / 2
                sb = min(sb, dfs(l,m) + dfs(m, r))
            }
            return sb
        }



        return dfs(0, N)
    }
}
