// https://leetcode.cn/problems/number-of-ways-to-assign-edge-weights-ii

class LCA {
    var tree:[[Int]]
    var deep:[Int]
    var fa:[[Int]]
    init(_ N: Int, _ edges: [[Int]]) {
        self.tree = [[Int]](repeating: [], count: N + 1)
        self.deep = [Int](repeating: 0, count: N + 1)
        self.fa = [[Int]](repeating: [Int](repeating: 0, count: 20), count: N + 1)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }
        dfs(1, 0)
//        print("\(#function)  \(deep)  \(fa)")
    }

    func dfs(_ u: Int, _ father: Int) {
        deep[u] = deep[father] + 1
        fa[u][0] = father
        for i in 1...19 {
            fa[u][i] = fa[fa[u][i - 1]][i - 1]
        }
        for v in tree[u] {
            if v != father {
                dfs(v, u)
            }
        }
    }



    func lca(_ u: Int, _ v: Int) -> Int {
        var curU = u
        var curV = v
        //保证u节点层次比较低
        if deep[curU] < deep[curV] {
            swap(&curU, &curV)
        }
        
        for i in stride(from: 19, through: 0, by: -1) {
            if deep[fa[curU][i]] >= deep[curV] {
                curU = fa[curU][i]
            }
        }

        if curU == curV {return curU}
        for i in stride(from: 19, through: 0, by: -1) {
            if fa[curU][i] != fa[curV][i] {
                curU = fa[curU][i]
                curV = fa[curV][i]
            }
        }

//        print("\(#function)  lca of (\(u),\(v)) is \(fa[curU][0]) ")
        return fa[curU][0]
    }


    func getDistance(_ u: Int, _ v: Int) -> Int {
        let ca = lca(u, v)
        return deep[u] + deep[v] - 2 * deep[ca]
    }
}

class Solution {
    func assignEdgeWeights(_ edges: [[Int]], _ queries: [[Int]]) -> [Int] {
        let lca = LCA(edges.count + 1, edges)
        return queries.map { q in
            let (u,v) = (q[0],q[1])
            if u == v {return 0}
            let dis = lca.getDistance(u, v)
            // print("\(u) --> \(v)  dis = \(dis)")
            return pow(2, dis - 1, 1_000_000_007)
        }
    }
    private func pow(_ num: Int, _ exp: Int, _ mod: Int) -> Int {
        if exp == 0 {return 1}
        let half  = pow(num, exp >> 1, mod)
        return (half * half) % mod  * (exp & 1 == 0 ? 1 : num) % mod
    }
}
