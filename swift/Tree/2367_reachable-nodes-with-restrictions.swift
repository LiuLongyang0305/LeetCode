// https://leetcode.com/problems/reachable-nodes-with-restrictions/
class Solution {
    func reachableNodes(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
        var tree = [[Int]](repeating: [], count: n)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }
        let set = Set<Int>(restricted)
        var ans = 0
        var visited = [Bool](repeating: false, count: n)

        func dfs(_ node: Int) {
            guard !visited[node] else {return}
            visited[node] = true
            ans += 1
            for next in tree[node]  {
                guard !set.contains(next) else {
                    continue
                }
                dfs(next)
            }
        }

        dfs(0)

        return ans
    }
}