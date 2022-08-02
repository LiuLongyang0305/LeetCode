// https://leetcode.com/problems/find-closest-node-to-given-two-nodes/
class Solution {
    private let INF = 1_000_000_007
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        let minDisFromNode1 = BFS(edges, node1)
        let minDisFromNode2 = BFS(edges, node2)
        let N = edges.count
        var ans = -1
        var dis = Int.max
        for i in 0..<N {
            let d = max(minDisFromNode1[i], minDisFromNode2[i])
            guard d != INF else {
                continue
            }
            if dis > d {
                ans = i
                dis = d
            }
        }
        return ans
    }


    private func  BFS(_ edges:[Int], _ startNode: Int) -> [Int] {
        let N = edges.count
        var ans = [Int](repeating: INF, count: N)
        ans[startNode] = 0
        var visited = [Bool](repeating: false, count: N)
        visited[startNode] = true
        var queue = [startNode]
        var dis = 0
        while !queue.isEmpty {
            dis += 1
            var newQueue = [Int]()
            for node in queue {
                guard -1 != edges[node] && !visited[edges[node]] else {continue}
                visited[edges[node]] = true
                ans[edges[node]] = dis
                newQueue.append(edges[node])

            }
            queue = newQueue

        }
        return ans
    }
}
