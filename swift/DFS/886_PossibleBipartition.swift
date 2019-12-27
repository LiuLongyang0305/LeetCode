//https://leetcode.com/problems/possible-bipartition/
 class Solution {
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        guard N > 2 else {
            return true
        }
        var graph = Array<Set<Int>>(repeating: Set<Int>(), count: N + 1)
        var visited = Array<Bool>(repeating: false, count: N + 1)
        var colored = Array<Int>(repeating: 0, count: N + 1)
        for dislike in dislikes {
            graph[dislike[0]].insert(dislike[1])
            graph[dislike[1]].insert(dislike[0])
        }
        func dfs(_ node: Int, _ color: Int) -> Bool {
            for next in graph[node] {
                guard !visited[next] || colored[next] == 3 - color else {
                    return false
                }
                if !visited[next] {
                    visited[next] = true
                    colored[next] = 3 - color
                    guard dfs(next, 3 - color) else {
                        return false
                    }
                }
            }
            return true
        }
        var i = N
        while i > 0 {
            if !visited[i] {
                visited[i] = true
                colored[i] = 1
                guard  dfs(i, 1) else {
                    return false
                }
            }
            i  -= 1
        }
        return true
    }
 }
