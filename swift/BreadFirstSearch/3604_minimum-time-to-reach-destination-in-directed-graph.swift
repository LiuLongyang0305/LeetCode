//https://leetcode.com/problems/minimum-time-to-reach-destination-in-directed-graph/
struct Pair: Comparable {
    static func < (lhs: Pair, rhs: Pair) -> Bool {
        lhs.time < rhs.time
    }

    var node: Int
    var time: Int
}

class Solution {
    private typealias Triple = (child:Int, st: Int,et: Int)
    func minTime(_ n: Int, _ edges: [[Int]]) -> Int {

        var tree = [Int:[Triple]]()
        for e in edges {
            tree[e[0],default: []].append((e[1],e[2],e[3]))
        }


        var heap = Heap<Pair>()
        heap.insert(Pair(node: 0, time: 0))
        var memo = [Int](repeating: Int.max / 2, count: n)
        memo[0] = 0

        while  let minNode = heap.popMin() {
            if minNode.time > memo[minNode.node] {
                continue
            }
            if minNode.node == n - 1 {
                return minNode.time
            }

            for (next,st,et) in tree[minNode.node] ?? [] {
                let newTime = max(minNode.time, st) + 1
                if newTime - 1 <= et && newTime < memo[next] {
                    memo[next] = newTime
                    heap.insert(Pair(node: next, time: newTime))
                }
            }

        }
        return -1
    }
}
