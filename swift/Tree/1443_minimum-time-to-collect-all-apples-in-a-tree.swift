// https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/
class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        guard n > 1 && hasApple.contains(true) else {
            return 0
        }
        var tree = [Int:[Int]]()
        for edge in edges {
            tree[edge[0], default: []].append(edge[1])
            tree[edge[1],default: []].append(edge[0])
        }
        var visited = Array<Bool>(repeating: false, count: n)
        var visitedEdges = Set<Int>()
        func update(_ path: [Int]) {
            guard path.count > 1 else {
                return
            }
            for idx in stride(from: path.count - 1, through: 1, by: -1) {
                let from = min(path[idx], path[idx - 1])
                let to = max(path[idx], path[idx - 1])
                let e = from << 32 | to
                guard !visitedEdges.contains(e) else {
                    return
                }
                visitedEdges.insert(e)
            }
        }
        func dfs(_ node: Int, _ curPath: [Int]) {
            guard !visited[node] else {
                return
            }
            visited[node] = true
            let newPath = curPath + [node]
            if hasApple[node] {
                update(newPath)
            }
            guard let children = tree[node] else {
                return
            }
            for ch in children {
                guard !visited[ch] else {
                    continue
                }
                dfs(ch, newPath)
            }
        }
        dfs(0, [])
        return visitedEdges.count << 1
    }
}