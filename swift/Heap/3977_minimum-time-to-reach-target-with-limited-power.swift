    //https://leetcode.cn/problems/minimum-time-to-reach-target-with-limited-power/
class Solution {
    private typealias NodeAndTime = (node:Int,time:Int)
    private struct HeapNode: Comparable {
        static func < (lhs: Solution.HeapNode, rhs: Solution.HeapNode) -> Bool {
            if lhs.dis == rhs.dis {
                return lhs.power > rhs.power
            }
            return lhs.dis < rhs.dis
        }

        var node: Int
        var dis:Int
        var power:Int
    }
    func minTimeMaxPower(_ n: Int, _ edges: [[Int]], _ power: Int, _ cost: [Int], _ source: Int, _ target: Int) -> [Int] {
        var g = [[NodeAndTime]](repeating: [], count: n)
        for e in edges {
            g[e[0]].append((e[1],e[2]))
        }
        var dis = [[Int]](repeating: [Int](repeating: Int.max, count: power + 5), count: n)
        dis[source][power] = 0
        var pq = Heap<HeapNode>()
        pq.insert(HeapNode(node: source, dis: 0, power: power))
        while let top = pq.popMin() {
            if top.node == target {
                return [top.dis,top.power]
            }
            if top.dis > dis[top.node][top.power] || top.power < cost[top.node] {continue}
            let newPower = top.power - cost[top.node]
            for (next,time) in g[top.node] {
                let newDis = top.dis + time
                if newDis < dis[next][newPower] {
                    dis[next][newPower] = newDis
                    pq.insert(HeapNode(node: next, dis: newDis, power: newPower))
                }
            }
        }
        return [-1,-1]
    }
}
