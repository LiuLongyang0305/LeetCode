    // https://leetcode.cn/problems/minimum-cost-to-buy-apples/
    class Solution {
        private typealias Pair = (node:Int, weight:Int)
        private struct NodeAndDis:Comparable {
            static func < (lhs: Solution.NodeAndDis, rhs: Solution.NodeAndDis) -> Bool {
                return lhs.dis < rhs.dis
            }

            var node: Int
            var dis: Int
        }
        func minCost(_ n: Int, _ roads: [[Int]], _ appleCost: [Int], _ k: Int) -> [Int] {
            let graph = buildGraph(roads, n)

            return (0..<n).map { solve($0, graph, n, appleCost, k)}
        }
        private func buildGraph(_ edges: [[Int]], _ n: Int) -> [[Pair]] {
            var g = [[Pair]](repeating: [], count: n)
            for e in edges {
                let (f,s,w) = (e[0] - 1,e[1] - 1,e[2])
                g[f].append((s,w))
                g[s].append((f,w))
            }
            return g
        }


        private func solve(_ start: Int, _ graph: [[Pair]], _ n:Int, _ appleCost:[Int], _ k:Int) -> Int {
            var distance = [Int](repeating: Int.max / 200, count: n)
            distance[start] = 0
            var pq = Heap<NodeAndDis>()
            pq.insert(NodeAndDis(node: start, dis: 0))
            while let top = pq.popMin() {
                let (cur,dis) = (top.node,top.dis)
                guard distance[cur] >= dis else {continue}
                for (child,weight) in graph[cur] {
                    let nd = weight + dis
                    if distance[child] > nd {
                        distance[child] = nd
                        pq.insert(NodeAndDis(node: child, dis: nd))
                    }
                }
            }
            // print(distance)
            var ans = Int.max / 2
            for i in 0..<n {
                ans = min(ans,distance[i] * (1 + k) + appleCost[i])
            }
            return ans
        }
    }
