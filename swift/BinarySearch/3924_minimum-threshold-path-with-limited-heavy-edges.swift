//https://leetcode.cn/problems/minimum-threshold-path-with-limited-heavy-edges/
class Solution {
    struct Edge {
        var next: Int
        var weight:Int
    }

    struct NodeAndDis: Comparable {
        static func < (lhs: Solution.NodeAndDis, rhs: Solution.NodeAndDis) -> Bool {
            return lhs.dis < rhs.dis
        }
        
        var node:Int
        var dis: Int
    }
    func minimumThreshold(_ n: Int, _ edges: [[Int]], _ source: Int, _ target: Int, _ k: Int) -> Int {
        guard source != target else {return 0}
        guard !edges.isEmpty else {
            return -1
        }
        var graph = [[Edge]](repeating: [], count: n)
        var maxW = 0
        for e in edges {
            let (f,t,w) = (e[0],e[1],e[2])
            graph[f].append(Edge(next: t, weight: w))
            graph[t].append(Edge(next: f, weight: w))
            maxW = max(maxW,w)
        }


        func check(_ limit: Int) -> Bool {
            var dis = [Int](repeating: Int.max, count: n)
            dis[source] = 0
            var heap = Heap<NodeAndDis>()
            heap.insert(NodeAndDis(node: source, dis: 0))
            while let min = heap.popMin() {
                if min.node == target && min.dis <= k{
                    return true
                }
                for e in graph[min.node] {
                    let newDis = min.dis + (e.weight > limit ? 1 : 0)
                    if newDis >= dis[e.next] {continue}
                    dis[e.next] = newDis
                    heap.insert(NodeAndDis(node: e.next, dis: newDis))
                }
            }
            return false
        }

        guard check(maxW * 2) else {return -1}


        var l = 0
        var r = maxW
        while l < r {
            let mid = (l + r) >> 1
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}
