// https://leetcode.cn/problems/maximize-the-number-of-target-nodes-after-connecting-trees-i
class Solution {
    func maxTargetNodes(_ edges1: [[Int]], _ edges2: [[Int]], _ k: Int) -> [Int] {

        let M = edges1.count + 1
        let counterTree1 = buildTree(edges1, k)
        let counterTree2 = buildTree(edges2, k - 1)
        let nodeCntMax = counterTree2.max()!
        return (0..<M).map { counterTree1[$0] + nodeCntMax}
    }

    private func buildTree(_ edges: [[Int]], _ limit: Int) -> [Int] {
        let N = edges.count + 1
        var ans = [Int](repeating: 0, count: N + 1)
        var tree = [[Int]](repeating: [], count: N + 1)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }

        func dfs(_ cur: Int, _ fa: Int, _ remainEdgesCnt: Int) -> Int {
            guard remainEdgesCnt >= 0 else {return 0}
            var ans = 1
            for child in tree[cur] {
                guard child != fa else {continue}
                ans += dfs(child, cur, remainEdgesCnt - 1)
            }
            return ans
        }


        for i in 0..<N {
            ans[i] = dfs(i, -1, limit)
        }

        return ans
    }


}
