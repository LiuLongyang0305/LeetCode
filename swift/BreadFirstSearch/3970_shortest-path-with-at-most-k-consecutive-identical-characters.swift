//https://leetcode.cn/problems/shortest-path-with-at-most-k-consecutive-identical-characters/
struct HeapNode: Comparable {
    static func < (lhs: HeapNode, rhs: HeapNode) -> Bool {
        return lhs.dis <= rhs.dis
    }

    var node: Int
    var dis: Int
    var cnt: Int
}

class Solution {
    private typealias Pair = (node:Int,weight:Int)
    func shortestPath(_ n: Int, _ edges: [[Int]], _ labels: String, _ k: Int) -> Int {
        var  graph = [[Pair]](repeating: [], count: n)
        for e in edges {
            graph[e[0]].append((e[1],e[2]))
        }
        let labelsToChars = [Character](labels)
        var minDis = [[Int]](repeating: [Int](repeating: Int.max, count: k + 5), count: n)
        var minHeap = Heap<HeapNode>()
        minHeap.insert(HeapNode(node: 0, dis: 0, cnt: 1))
        while let top = minHeap.popMin() {
            guard top.node != n - 1 else {return top.dis}
            if top.dis > minDis[top.node][top.cnt] {continue}
            for (child,weight) in graph[top.node] {
                let newCnt = labelsToChars[top.node] == labelsToChars[child] ? (top.cnt + 1) : 1
                let newDis = top.dis + weight
                if newCnt <= k && newDis < minDis[child][newCnt] {
                    minDis[child][newCnt] = newDis
                    minHeap.insert(HeapNode(node: child, dis: newDis, cnt: newCnt))
                }
            }
        }
        return -1
    }
}
