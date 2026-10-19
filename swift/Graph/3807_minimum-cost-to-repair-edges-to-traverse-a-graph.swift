    // https://leetcode.cn/problems/minimum-cost-to-repair-edges-to-traverse-a-graph/


class Solution {
    func minCost(_ n: Int, _ edges: [[Int]], _ k: Int) -> Int {
        let graph = buildGraph(edges, n)
        guard check(graph, 10000000000, k, n) else {return -1}
        var l = 1
        var r = 1000000000

        while l < r {
            let mid = (l + r) >> 1
            if check(graph, mid,k,n) {
                r = mid
            } else {
                l = mid + 1
            }
        }

        return l
    }

    private func buildGraph(_ edges:[[Int]],_ n: Int) -> [[Int:Int]] {
        var g = [[Int:Int]](repeating: [:], count: n)
        for e in edges {
            let (f,s,w) = (e[0],e[1],e[2])
            g[f][s] = w
            g[s][f] = w
        }
        return g
    }
    private func check(_ graph:[[Int:Int]], _ limit: Int, _ k: Int, _ n: Int) -> Bool {
        var visited = [Bool](repeating: false, count: n)
        visited[0] = true
        var queue = [(0,k)]
        while !queue.isEmpty {
//            print(queue.count)
            var newQueue = [(Int,Int)]()
            for (curNode,rk) in queue {
                for (next,w) in graph[curNode] {
                    guard !visited[next] else {continue}
                    guard w <= limit else {continue}
                    guard rk >= 1 else {continue}
                    if next == n - 1 {return true}
                    visited[next] = true
                    newQueue.append((next,rk - 1))
                }
            }
            queue = newQueue
        }
        return false
    }
}
