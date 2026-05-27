// https://leetcode.cn/problems/minimum-weighted-subgraph-with-the-required-paths-ii/
typealias NodeAndWeight = (node: Int, weight: Int)
class LCA3 {
    private var n: Int//节点个数
    private var LOG: Int//最大深度，假设是一条链，最多需要保存的祖先节点数
    private var depth: [Int]//任意节点的深度，查询的时候需要用到
    private var up: [[Int]]      // up[v][k] = v 的第 2^k 级祖先
    private var graph: [[NodeAndWeight]]//树或者图
    private var dis: [Int]
    init(_ n: Int,_ g:[[NodeAndWeight]]) {
        self.n = n
        self.LOG = Int(log2(Double(n))) + 1
        self.depth = [Int](repeating: 0, count: n)
        self.up = [[Int]](repeating: [Int](repeating: -1, count: LOG), count: n)
        self.graph = g
        self.dis = [Int](repeating: Int.max, count: n)
    }

        // 预处理（DFS）
    func build(_ root: Int = 0) {

        var visited = [Bool](repeating: false, count: n)
        dis[root] = 0
        func dfs(_ u: Int, _ parent: Int) {
            visited[u] = true
            up[u][0] = parent//U的2^0次方祖先即父节点
                             //2 ^ k = 2 ^ (k - 1) + 2 ^ (k - 1)
            for k in 1..<LOG {
                if up[u][k - 1] != -1 {
                    up[u][k] = up[up[u][k - 1]][k - 1]
                }
            }
            for (v,w) in graph[u] where !visited[v] {
                depth[v] = depth[u] + 1
                dis[v] = dis[u] + w
                dfs(v, u)
            }
        }

        dfs(root, -1)
    }

        // 查询 LCA
    func query(_ u: Int, _ v: Int) -> Int {
        var a = u, b = v
        if depth[a] < depth[b] {
            swap(&a, &b)
        }

            // 1. 拉到同一层,也是拼凑法
        let diff = depth[a] - depth[b]
        for k in 0..<LOG where (diff >> k) & 1 == 1 {
            a = up[a][k]
        }
        if a == b { return a }

            // 2. 一起往上跳，从大到小遍历，类似二分
        for k in stride(from: LOG - 1, through: 0, by: -1) {
            if up[a][k] != up[b][k] {
                a = up[a][k]
                b = up[b][k]
            }
        }
        return up[a][0]
    }

    func getDis(_ x: Int, _ y: Int) -> Int {
        return dis[x] + dis[y] - 2 * dis[query(x, y)]
    }
}

class Solution {
    func minimumWeight(_ edges: [[Int]], _ queries: [[Int]]) -> [Int] {
        var g = [[NodeAndWeight]](repeating: [], count: edges.count + 1)
        for e in edges{
            g[e[0]].append((e[1],e[2]))
            g[e[1]].append((e[0],e[2]))
        }
        let lca = LCA3(edges.count + 1, g)
        lca.build()
        var sb = [Int]()
        for q in queries {
            let (a,b,c) = (q[0],q[1],q[2])
            sb.append((lca.getDis(a, b) + lca.getDis(b, c) + lca.getDis(a, c)) / 2)
        }
        return sb
    }
}
