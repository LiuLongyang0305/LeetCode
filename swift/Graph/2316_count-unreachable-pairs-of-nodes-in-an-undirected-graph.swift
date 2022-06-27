// https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/
class Solution {
    func countPairs(_ n: Int, _ edges: [[Int]]) -> Int {
        var ans = 0
        var graph = [[Int]](repeating: [Int](), count: n)
        for e in edges {
            graph[e[0]].append(e[1])
            graph[e[1]].append(e[0])
        }

        var visited = [Bool](repeating: false, count: n)
        var cnt = 0

        func dfs(_ node: Int ) {
            visited[node] = true
            cnt += 1
            for next in graph[node] {
                if !visited[next] {
                    dfs(next)
                }
            }
        }
        for node in 0..<n {
            guard !visited[node] else {continue}
            cnt = 0
            dfs(node)
            ans += cnt * (n - cnt)
        }
        return ans >> 1
    }
}