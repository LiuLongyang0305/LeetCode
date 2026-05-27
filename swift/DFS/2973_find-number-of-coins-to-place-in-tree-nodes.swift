    // https://leetcode.cn/problems/find-number-of-coins-to-place-in-tree-nodes
class Solution {

    private typealias Pair = (positive:Heap<Int>, negtive:Heap<Int>)
    func placedCoins(_ edges: [[Int]], _ cost: [Int]) -> [Int] {

        let N = cost.count
        var graph = [[Int]](repeating: [], count: N)

        for e in edges {
            graph[e[0]].append(e[1])
            graph[e[1]].append(e[0])
        }
        var sb = [Int](repeating: -1, count: N)

        func dfs(_ cur: Int, _ fa: Int) -> Pair {
            var curPositiveHeap = Heap<Int>()
            var curNegtiveHeap = Heap<Int>()
            if cost[cur] > 0 {
                curPositiveHeap.insert(cost[cur])
            } else {
                curNegtiveHeap.insert(cost[cur])
            }
            for next in graph[cur] where next != fa {
                let (ph,nh) = dfs(next, cur)
                curPositiveHeap.insert(contentsOf: ph.unordered)
                curNegtiveHeap.insert(contentsOf: nh.unordered)
            }
            while curPositiveHeap.count > 3 {
                curPositiveHeap.popMin()
            }
            while curNegtiveHeap.count > 3 {
                let _ = curNegtiveHeap.popMax()
            }
            if curNegtiveHeap.count + curPositiveHeap.count < 3 {
                sb[cur] = 1
            } else {
                var t = 0
                if curPositiveHeap.count == 3 {
                    t = max(t,curPositiveHeap.unordered.reduce(1, { $0 * $1}))
                }
                if curPositiveHeap.count >= 1 && curNegtiveHeap.count >= 2 {
                    let sv = curNegtiveHeap.unordered.sorted()
                    t = max(t,curPositiveHeap.max! * sv[0] * sv[1])
                }
                sb[cur] = t

            }
            return (curPositiveHeap,curNegtiveHeap)
        }
        dfs(0, -1)
        return sb
    }
}
