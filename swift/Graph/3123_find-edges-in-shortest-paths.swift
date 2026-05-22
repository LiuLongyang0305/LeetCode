// https://leetcode.cn/problems/find-edges-in-shortest-paths/
struct NodeAndDis: Comparable {
    static func < (lhs: NodeAndDis, rhs: NodeAndDis) -> Bool {
        return lhs.dis < rhs.dis
    }

    var node: Int
    var dis: Int
}
typealias Pair = (endNode:Int,weight:Int)
    class Solution {
        func findAnswer(_ n: Int, _ edges: [[Int]]) -> [Bool] {
            var graph = [[Pair]](repeating: [], count: n)
            for e in edges {
                let (f,e,w) = (e[0],e[1],e[2])
                graph[f].append((e,w))
                graph[e].append((f,w))
            }
            let minDis = shortestPath(graph, 0)
            guard minDis[n - 1] != Int.max else {return [Bool](repeating: false, count: edges.count)}
            print(minDis)
            var visited = [Bool](repeating: false, count: n)
            var sb = Set<Int>()
            dfs(n - 1,graph, minDis, &visited,&sb)
            return edges.map { sb.contains($0.hashValue)}
        }
        private func shortestPath(_ g: [[Pair]],_ start: Int) -> [Int] {
            var dis = [Int](repeating: Int.max, count: g.count)
            dis[start] = 0
            var minHeap = Heap<NodeAndDis>()
            minHeap.insert(NodeAndDis(node: start, dis: 0))
            while let top = minHeap.popMin() {
                if top.dis > dis[top.node] {continue}
                for (nextNode,w) in g[top.node] {
                    let newDis = top.dis + w
                    if newDis <= dis[nextNode] {
                        dis[nextNode] = newDis
                        minHeap.insert(NodeAndDis(node: nextNode, dis: newDis))
                    }
                }
            }
            return dis
        }

        private func dfs(_ node: Int, _ graph: [[Pair]], _ dis: [Int] , _ visited: inout [Bool], _ onPath: inout Set<Int>) {
            visited[node] = true
            for (endNode,weight) in graph[node] {
                if dis[endNode] + weight != dis[node] {
                    continue
                }
                onPath.insert([node,endNode,weight].hashValue)
                onPath.insert([endNode,node,weight].hashValue)
                if !visited[endNode] {
                    dfs(endNode, graph, dis, &visited, &onPath)
                }
            }

        }
    }
