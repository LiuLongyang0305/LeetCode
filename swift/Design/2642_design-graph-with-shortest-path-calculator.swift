    // https://leetcode.cn/problems/design-graph-with-shortest-path-calculator/
    class Graph {

        private typealias Edge = (node: Int,weight: Int)
        struct NodeAndDis: Comparable {
            static func < (lhs: Graph.NodeAndDis, rhs: Graph.NodeAndDis) -> Bool {
                return lhs.dis < rhs.dis
            }
            
            var node: Int
            var dis: Int
        }
        private var graph = [[Edge]]()
        private var N : Int = 0
        init(_ n: Int, _ edges: [[Int]]) {
            self.N = n
            graph = [[Edge]](repeating: [], count: n)
            for e in edges {
                graph[e[0]].append((e[1],e[2]))
            }
        }

        func addEdge(_ edge: [Int]) {
            guard edge[0] >= 0 && edge[1] >= 0 && edge[0] < N && edge[1] < N else {return}
            graph[edge[0]].append((edge[1],edge[2]))
        }

        func shortestPath(_ node1: Int, _ node2: Int) -> Int {
            var minDis = [Int](repeating: Int.max, count: N)
            var minHeap = Heap<NodeAndDis>()
            minDis[node1] = 0
            minHeap.insert(NodeAndDis(node: node1, dis: 0))
            while let top = minHeap.popMin() {
                guard  top.dis <= minDis[top.node]  else {continue}
                for (child,weight) in graph[top.node] {
                    let newDis = top.dis + weight
                    if newDis < minDis[child] {
                        minDis[child] = newDis
                        minHeap.insert(NodeAndDis(node: child, dis: newDis))
                    }
                }
            }
            return minDis[node2] == Int.max ? -1 : minDis[node2]
        }
    }
/**
 * Your Graph object will be instantiated and called as such:
 * let obj = Graph(n, edges)
 * obj.addEdge(edge)
 * let ret_2: Int = obj.shortestPath(node1, node2)
 */
