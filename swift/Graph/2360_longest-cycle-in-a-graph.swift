// https://leetcode.com/problems/longest-cycle-in-a-graph/
class Solution {
    func longestCycle(_ edges: [Int]) -> Int {
        let N = edges.count
        var inDegree = [Int](repeating: 0, count: N)
        for i in 0..<N {
            if edges[i] != -1 {
                inDegree[edges[i]] += 1
            }
        }

        var queue = [Int]()
        for i in 0..<N {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            var newQueue = [Int]()
            for i in queue {
                if edges[i] != -1 {
                    inDegree[edges[i]] -= 1
                    if inDegree[edges[i]] == 0 {
                        newQueue.append(edges[i])
                    }
                }
            }
            queue = newQueue
        }
        let candidate = (0..<N).filter { inDegree[$0] > 0}
//        print(candidate)
        guard !candidate.isEmpty else {
            return -1
        }


        var visited = [Int](repeating: -1, count: N)
        var id = 0
        var ans = -1



        func dfs(_ node: Int) {
            id += 1
            if visited[node] == -1 {
                visited[node] = id
                if -1 != edges[node] {
                    dfs(edges[node])
                }
            } else {
                ans = max(ans, id - visited[node])
            }
            id -= 1
        }


        for node in candidate {
            guard -1 == visited[node] else {
                continue
            }
            dfs(node)
        }

        return ans
    }
}