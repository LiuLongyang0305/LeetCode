//https://leetcode.com/problems/number-of-ways-to-assign-edge-weights-i
class Solution {
    private let MOD = 1_000_000_007
    func assignEdgeWeights(_ edges: [[Int]]) -> Int {
        var g = [Int:[Int]]()
        for e in edges {
            g[e[0],default: []].append(e[1])
            g[e[1],default: []].append(e[0])
        }




        func dfs(_ cur: Int, _ fa: Int) -> Int {
            var ans = 0
            for c in g[cur]! {
                if c != fa {
                    ans = max(ans, 1 + dfs(c, cur))
                }
            }
            return ans
        }
        let level = dfs(1, -1)
        // print(level)
        //偶数
        var even = 1
//        奇数
        var odd = 0


        for _ in 0..<(level) {
             let newEven = (even + odd) % MOD
            let newOdd = (even + odd) % MOD
            even = newEven
            odd = newOdd
        }


        return even
    }
}

