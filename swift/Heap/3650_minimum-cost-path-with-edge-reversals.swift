 // https://leetcode.cn/problems/minimum-cost-path-with-edge-reversals/

struct DisAndCurNode: Comparable,Hashable {
    static func < (lhs: DisAndCurNode, rhs: DisAndCurNode) -> Bool {
        return lhs.dis < rhs.dis
    }

    var dis: Int
    var curNode: Int
}


    class Solution {



        private typealias EW = (node: Int,weight:Int)
        func minCost(_ n: Int, _ edges: [[Int]]) -> Int {
            var graph = [[EW]](repeating: [], count: n)
            for e in edges {
                graph[e[0]].append((e[1],e[2]))
                graph[e[1]].append((e[0], 2 * e[2]))
            }
            var minDis = [Int](repeating: Int.max, count: n)
            var visited = [Bool](repeating: false, count: n)
            minDis[0] = 0
//            visited[0] = true
            var heap = Heap<DisAndCurNode>()
            heap.insert(DisAndCurNode(dis: 0, curNode: 0))
            while !heap.isEmpty {
                let node = heap.popMin()!
                if node.curNode == n - 1 {
                    return minDis[n - 1]
                }
                if visited[node.curNode] {continue}
                visited[node.curNode] = true

                for (next,weight) in graph[node.curNode] {
                    if minDis[node.curNode] + weight < minDis[next] {
                        minDis[next] = minDis[node.curNode] + weight
                        heap.insert(DisAndCurNode(dis: minDis[next], curNode: next))
                    }
                }
            }
            return -1
        }
    }
