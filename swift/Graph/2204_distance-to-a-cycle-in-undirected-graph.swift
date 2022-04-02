//  https://leetcode.com/problems/distance-to-a-cycle-in-undirected-graph/
class Solution {
    func distanceToCycle(_ n: Int, _ edges: [[Int]]) -> [Int] {
        //建图并统计出度
        var graph = [[Int]](repeating: [], count: n)
        var outDegree = [Int](repeating: 0, count: n)

        edges.forEach { e in
            graph[e[0]].append(e[1])
            graph[e[1]].append(e[0])
            outDegree[e[0]] += 1
            outDegree[e[1]] += 1
        }

        //拓扑排序求环
        var isInCycle = [Bool](repeating: true, count: n)
        var q = [Int]()
        for node in 0..<n {
            if outDegree[node] == 1 {
                isInCycle[node] = false
                q.append(node)
            }
        }

        while !q.isEmpty {
            var newQ = [Int]()
            for node in q {
                for next in graph[node] {
                    outDegree[next] -= 1
                    if outDegree[next] == 1 {
                        isInCycle[next] = false
                        newQ.append(next)
                    }
                }
            }
            q = newQ
        }

        var nodesInCycle = [Int]()
        for node in 0..<n {
            if isInCycle[node] {
                nodesInCycle.append(node)
            }
        }
        //BFS求最短距离
        var distance = [Int](repeating: 0, count: n)
        var visited = [Bool](repeating: false, count: n)
        nodesInCycle.forEach {visited[$0] = true}
        var queue = nodesInCycle

        var dis = 0
        while !queue.isEmpty {
            dis += 1
            var newQueue = [Int]()
            for node in queue {
                for next in graph[node] {
                    guard !visited[next] else {continue}
                    distance[next] = dis
                    visited[next] = true
                    newQueue.append(next)
                }
            }
            queue = newQueue
        }
        return distance
    }
}