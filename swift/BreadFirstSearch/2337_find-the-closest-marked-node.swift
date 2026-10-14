    // https://leetcode.cn/problems/find-the-closest-marked-node/
    class Solution {
        struct NodeAndDis: Comparable {
            static func < (lhs: Solution.NodeAndDis, rhs: Solution.NodeAndDis) -> Bool {
                return lhs.dis < rhs.dis
            }

            var node: Int
            var dis: Int
        }
        func minimumDistance(_ n: Int, _ edges: [[Int]], _ s: Int, _ marked: [Int]) -> Int {
            var graph = [[Int:Int]](repeating: [:], count: n)
            for e in edges {
                let (u,v,w) = (e[0],e[1],e[2])
                if let w1 = graph[u][v] {
                    if w < w1  {
                        graph[u][v] = w
                    }
                } else {
                    graph[u][v] = w
                }
            }
            let markedSet = Set<Int>(marked)
            var minDis = [Int](repeating: Int.max / 2, count: n)
            minDis[s] = 0
            var heap = Heap<NodeAndDis>()
            heap.insert(NodeAndDis(node: s, dis: 0))

            while let top = heap.popMin() {
                let (node,dis) = (top.node,top.dis)
                for (next,w) in graph[node] {
                    let nd = dis + w
                    if nd < minDis[next] {
                        minDis[next] = nd
                        heap.insert(NodeAndDis(node: next, dis: nd))
                    }
                }
            }

            var sb = Int.max / 2
            for node in marked {
                sb = min(sb,minDis[node])
            }
            return sb == Int.max / 2 ? -1 : sb
        }
    }
