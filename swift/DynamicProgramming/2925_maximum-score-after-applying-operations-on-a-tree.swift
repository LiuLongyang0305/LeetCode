//https://leetcode.com/problems/maximum-score-after-applying-operations-on-a-tree
class Solution {
    func maximumScoreAfterOperations(_ edges: [[Int]], _ values: [Int]) -> Int {

        var g = [[Int]](repeating: [], count: values.count)
        g[0].append(-1)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        
        func  dfs(_ x: Int, _ fa: Int) -> Int {
            if g[x].count == 1 {
                return values[x]
            }
            var loss = 0
            for y in g[x] {
                if y != fa {
                    loss += dfs(y, x)
                }
            }
            return min(values[x], loss)
        }

        return values.reduce(0) { $0 + $1} - dfs(0,-1)
    }
}
