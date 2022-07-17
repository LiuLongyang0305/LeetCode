//https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/
class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        let labbelsToInt = labels.map {Int($0.asciiValue ?? 0) - 97}
        var ans = [Int](repeating: 0, count: n)
        var tree = [[Int]](repeating: [], count: n)

        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }
        
        func dfs(_ node: Int, _ parent: Int) -> [Int] {
            var res = [Int](repeating: 0, count: 26)
            for next in tree[node] {
                guard parent != next else {continue}
                let temp = dfs(next,node)
                for i in 0..<26 {
                    res[i] += temp[i]
                }
            }
            res[labbelsToInt[node]] += 1
            ans[node] = res[labbelsToInt[node]]
            return res
        }

        let _ = dfs(0,-1)

        return ans
    }
}