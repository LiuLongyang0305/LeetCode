//https://leetcode.com/problems/count-the-number-of-complete-components/
class Solution {
    func countCompleteComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = [[Int]](repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        var visited = [Bool](repeating: false, count: n)

        var v = 0
        var e = 0
        func dfs(_ x: Int) {
            visited[x] = true
            v += 1
            e += graph[x].count

            for y in graph[x] {
                if !visited[y] {
                    dfs(y)
                }
            }
        }

        var ans = 0

        for i in 0..<n {
            if !visited[i] {
                v = 0
                e = 0
                dfs(i)
                if e == v * (v - 1) {
                    ans += 1
                }
            }
        }
        return ans
    }
}
