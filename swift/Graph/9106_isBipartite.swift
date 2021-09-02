// https://leetcode-cn.com/problems/vEAB3K/
class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let N = graph.count
        var color = Array<Int>(repeating: 0, count: N)
        
        func dfs(_ node: Int, _ col: Int) -> Bool {
            color[node] = col
            for child in graph[node] {
                if color[child] == 0 {
                    guard dfs(child, 3 - col) else {
                        return false
                    }
                } else {
                    guard col == 3 - color[child] else {
                        return false
                    }
                }
            }
            return true
        }
        
        
        for node in 0..<N {
            if color[node] == 0 {
                guard dfs(node, 1) else {
                    return false
                }
            }
        }
        
        return true
    }
}