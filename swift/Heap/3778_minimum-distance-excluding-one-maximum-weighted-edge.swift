    // https://leetcode.cn/problems/minimum-distance-excluding-one-maximum-weighted-edge
    class Solution {
        private let EXCLUSION_FALSE = 0
        private let EXCLUSION_TRUE = 1
        private let INF = Int.max / 2
        private struct Tuple:Comparable {
            static func < (lhs: Solution.Tuple, rhs: Solution.Tuple) -> Bool {
                return lhs.dis < rhs.dis
            }

            var node:Int
            var dis:Int
            var hasExclusion:Int
        }
        private typealias Pair = (child:Int,weight:Int)
        func minCostExcludingMax(_ n: Int, _ edges: [[Int]]) -> Int {
            let graph = buildGraph(edges, n)
            var distance = [[Int]](repeating: [Int](repeating: INF, count: n), count: 2)
            distance[EXCLUSION_FALSE][0] = 0
            var pq = Heap<Tuple>()
            pq.insert(Tuple(node: 0, dis: 0, hasExclusion: EXCLUSION_FALSE))
            while let top = pq.popMin() {
                let (cur,dis,hasExclusion) = (top.node,top.dis,top.hasExclusion)
                guard distance[hasExclusion][cur] >= dis else {continue}
                for (child,weight) in graph[cur] {
                    if hasExclusion == EXCLUSION_FALSE && distance[EXCLUSION_TRUE][child] > dis {
                        distance[EXCLUSION_TRUE][child] = dis
                        pq.insert(Tuple(node: child, dis: dis, hasExclusion: EXCLUSION_TRUE))
                    }
                    if distance[hasExclusion][child] > dis + weight {
                        distance[hasExclusion][child] = dis + weight
                        pq.insert(Tuple(node: child, dis: dis + weight, hasExclusion: hasExclusion))
                    }
                }

            }
            return distance[EXCLUSION_TRUE][n - 1]
        }

        private func buildGraph(_ edges: [[Int]], _ n: Int) -> [[Pair]] {
            var g = [[Pair]](repeating: [], count: n)
            for e in edges {
                let (f,s,w) = (e[0],e[1],e[2])
                g[f].append((s,w))
                g[s].append((f,w))
            }
            return g
        }
    }
