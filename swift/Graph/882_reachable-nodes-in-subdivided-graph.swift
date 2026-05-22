//https://leetcode.cn/problems/reachable-nodes-in-subdivided-graph/
struct NodeAndDis: Comparable {
        static func < (lhs: NodeAndDis, rhs: NodeAndDis) -> Bool {
            return lhs.dis < rhs.dis
        }
    
        var node: Int
        var dis: Int
    }
    class Solution {
        private typealias Pair = (node: Int, weigjht: Int)
        func reachableNodes(_ edges: [[Int]], _ maxMoves: Int, _ n: Int) -> Int {
            var graph = [[Pair]](repeating: [], count: n)
            for e in edges {
                let (f,e,w) = (e[0],e[1],e[2] + 1)
                graph[f].append((e,w))
                graph[e].append((f,w))
            }
            let dis = shortestPath(graph, 0, maxMoves)
            var sb = 0
            for d in dis where d <= maxMoves {
                sb += 1
            }
            for e in edges {
                let (f,e,cnt) = (e[0],e[1],e[2])
                let a = max(maxMoves - dis[f],0)
                let b = max(maxMoves - dis[e],0)
                sb += min(a + b,cnt)
            }
            return sb
        }
    
        private func shortestPath(_ g: [[Pair]],_ start: Int, _ maxMoves: Int) -> [Int] {
            var dis = [Int](repeating: Int.max, count: g.count)
            dis[start] = 0
            var minHeap = Heap<NodeAndDis>()
            minHeap.insert(NodeAndDis(node: start, dis: 0))
            while let top = minHeap.popMin(),top.dis < maxMoves {
                if top.dis > dis[top.node] {continue}
                // print(top)
                for (nextNode,w) in g[top.node] {
                    let newDis = top.dis + w
                    // print("nn = \(nextNode) nd = \(newDis) \(dis[nextNode])")
                    if newDis < dis[nextNode] {
                        dis[nextNode] = newDis
                        minHeap.insert(NodeAndDis(node: nextNode, dis: newDis))
                    }
                }
            }
            return dis
        }
    }

