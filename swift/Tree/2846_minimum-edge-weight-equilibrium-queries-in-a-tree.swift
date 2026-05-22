    //https://leetcode.cn/problems/minimum-edge-weight-equilibrium-queries-in-a-tree/
class Solution {
    func minOperationsQueries(_ n: Int, _ edges: [[Int]], _ queries: [[Int]]) -> [Int] {
        var depth = [Int](repeating: 0, count: n)
        let LOG = Int(log2(Double(n))) + 1
        var up = [[Int]](repeating: [Int](repeating: -1, count: LOG), count: n)
        var graph = [[(nextNode:Int,weight:Int)]](repeating: [], count: n)
        var counters = [[Int]](repeating: [], count: n)
        for e in edges {
            let (f,e,w) = (e[0],e[1],e[2] - 1)
            graph[f].append((e,w))
            graph[e].append((f,w))
        }

        //创建LCA所需要数据
        var curCounter = [Int](repeating: 0, count: 26)
        func build(_ root: Int = 0) {
            var visited = [Bool](repeating: false, count: n)
            func dfs(_ u: Int, _ parent: Int) {
                visited[u] = true
                up[u][0] = parent
                counters[u] = curCounter
                for k in stride(from: 1, to: LOG, by: 1) {
                    if -1 != up[u][k - 1] {
                        up[u][k] = up[up[u][k - 1]][k - 1]
                    }
                }

                for (n,w) in graph[u] where !visited[n] {
                    depth[n] = depth[u] + 1
                    curCounter[w] += 1
                    dfs(n, u)
                    curCounter[w] -= 1
                }
            }
            dfs(root, -1)
        }

        func query(_ u: Int, _ v: Int) -> Int {
            var a = u, b = v
            if depth[a] < depth[b] {
                swap(&a, &b)
            }
            let diff = depth[a] - depth[b]
            for k in 0..<LOG where (diff >> k) & 1 != 0 {
                a = up[a][k]
            }
            guard a != b else {return a}
            for k in stride(from: LOG - 1, through: 0, by: -1) {
                if up[a][k] != up[b][k] {
                    a = up[a][k]
                    b = up[b][k]
                }
            }
            return up[a][0]
        }

        build()
        var sb = [Int]()
        for q in queries {
            let (u,v) = (q[0],q[1])
            let lca = query(u, v)
            var ans = 0
            for i in 0...25 {
                ans = max(ans,counters[u][i] + counters[v][i] - 2 * counters[lca][i])
            }
            sb.append(depth[u] + depth[v] - 2 * depth[lca] - ans)
        }
        return sb
    }
}
