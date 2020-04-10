// https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = [Int:[Int]]()
        for edge in edges {
            if nil == graph[edge[0]] {
                graph[edge[0]] = []
            }
            graph[edge[0]]?.append(edge[1])
            if nil == graph[edge[1]] {
                graph[edge[1]] = []
            }
            graph[edge[1]]?.append(edge[0])
        }
        var visited = Array<Bool>(repeating: false, count: n)
        func dfs(_ root: Int) {
            visited[root] = true
            guard let children = graph[root] else {
                return
            }
            for child in children {
                if !visited[child] {
                    dfs(child)
                }
            }
        }
        var ans = 0
        for i in 0..<n {
            if !visited[i] {
                ans += 1
                dfs(i)
            }
        }
        return ans
    }
}
