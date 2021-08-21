// https://leetcode.com/problems/find-if-path-exists-in-graph/
class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {
        var tree = Array<[Int]>(repeating: [], count: n)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }
        var visited = Array<Bool>(repeating: false, count: n)
        var flag = false
        func dfs(_ root: Int) {
            guard !flag else {
                return
            }
            guard end != root else {
                flag = true
                return
            }
            for child in tree[root] {
                if !visited[child] {
                    visited[child] = true
                    dfs(child)
                }
            }
        }
        dfs(start)
        visited[start] = true
        return flag
    }
}