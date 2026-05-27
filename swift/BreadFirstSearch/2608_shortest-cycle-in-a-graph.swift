//https://leetcode.cn/problems/shortest-cycle-in-a-graph/
    class Solution {
        private typealias Pair = (node: Int, fa: Int)
        func findShortestCycle(_ n: Int, _ edges: [[Int]]) -> Int {
            var graph = [[Int]](repeating: [], count: n)
            for e in edges {
                graph[e[0]].append(e[1])
                graph[e[1]].append(e[0])
            }

            var sb = Int.max
            for i in 0..<n {
                sb = min(sb,BFSForCircle(graph, i, n))
            }

            return sb == Int.max ? -1 : sb
        }

        private func BFSForCircle(_ g:[[Int]], _ start: Int, _ n: Int) -> Int {
            var sb = Int.max
            var dis = [Int](repeating: Int.max, count: n)
            dis[start] = 0
            var q = [Pair]()
            q.append((start,-1))
            while !q.isEmpty {
                let (cur,fa) = q.removeFirst()
                for next in g[cur] {
                    if dis[next] == Int.max {
                        dis[next] = dis[cur] + 1
                        q.append((next,cur))
                    } else if next != fa {
                        sb = min(sb,dis[cur] + dis[next] + 1)
                    }
                }
            }
            return sb
        }
    }
