// https://leetcode.com/problems/all-paths-from-source-lead-to-destination/
class Solution {
    func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var graph = [Int:[Int]]()
        for edge in edges {
            if nil == graph[edge[0]] {
                graph[edge[0]] = []
            }
            graph[edge[0]]?.append(edge[1])
        }
        var visited = Set<Int>()
        func dfs(_ root: Int) -> Bool{
            guard let children = graph[root] else {
                return root == destination
            }
            for ch in children {
                guard !visited.contains(ch) else {
                    return false
                }
                visited.insert(ch)
                guard dfs(ch) else {
                    return false
                }
                visited.remove(ch)
            }
            return true
        }
        visited.insert(source)
        return dfs(source)
    }
}

