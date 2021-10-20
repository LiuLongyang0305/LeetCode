// https://leetcode.com/problems/the-time-when-the-network-becomes-idle/
class Solution {
    func networkBecomesIdle(_ edges: [[Int]], _ patience: [Int]) -> Int {
        var graph = [Int:[Int]]()
        //Create graph
        edges.forEach { e in
            graph[e[0], default: []].append(e[1])
            graph[e[1], default: []].append(e[0])
        }
        let N = patience.count
        var ans = 0

        //BFS
        var visited = [Bool](repeating: false, count: N)
        visited[0] = true
        var q = [Int]()
        q.append(0)
        var step = 0
        while !q.isEmpty {
            step += 1
            var newLevel = [Int]()
            for node in q {
                guard let children = graph[node] else {continue}
                for next in children  {
                    if !visited[next] {
                        visited[next] = true
                        newLevel.append(next)
                        let t = 2 * step
                        let lastSendingDataTime  = patience[next] >= t ? 0 : (t - (t % patience[next] == 0 ? patience[next] : (t % patience[next])))
                        ans = max(ans, lastSendingDataTime + t + 1)
                    }
                }
            }
            q = newLevel
        }
        return ans
    }
}