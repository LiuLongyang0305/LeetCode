//  https://leetcode.cn/problems/choose-edges-to-maximize-score-in-a-tree/
class Solution {
    private typealias Edge = (node: Int,weight:Int)
    func maxScore(_ edges: [[Int]]) -> Int {
        guard edges.count > 1 else {return 0}
        let N = edges.count
        var tree = [[Edge]](repeating: [], count: N)
        for i in 1..<N {
            tree[edges[i][0]].append((i,edges[i][1]))
        }

//        print(tree)
        func  dfs( _ cur: Int) -> (Int,Int) {
            guard !tree[cur].isEmpty else {return (0,0)}
            let M = tree[cur].count
            var ts = [Int](repeating: 0, count: M)
            var fs = [Int](repeating: 0, count: M)

            for j in 0..<M {
                let t = dfs(tree[cur][j].node)
                ts[j] = t.0
                fs[j] = t.1
            }
            let t = fs.reduce(0) { $0 + $1}
            var f = 0
            for j in 0..<M {
                let (c,v) = tree[cur][j]
                f = max(f, t - fs[j] + max(0, ts[j] + v))
            }
            f = max(f, t)
            return (t,f)
        }




        return dfs(0).1
    }
}