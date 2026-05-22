//https://leetcode.cn/problems/minimize-the-total-price-of-the-trips/
class Solution {
    private typealias Pair = (curNodeKeep: Int,curNodeHalf: Int)
    func minimumTotalPrice(_ n: Int, _ edges: [[Int]], _ price: [Int], _ trips: [[Int]]) -> Int {
        var next = [[Int]](repeating: [], count: n)
        for e in edges {
            next[e[0]].append(e[1])
            next[e[1]].append(e[0])
        }
        var counter = [Int](repeating: 0, count: n)
        for trip in trips {
            dfs(trip[0], -1, trip[1], next, &counter)
        }

        let sb = dp(0,-1,price,next,counter)
        return min(sb.curNodeHalf,sb.curNodeKeep)
    }

    @discardableResult
    private func dfs(_ node: Int, _ parent: Int, _ end: Int, _ next: [[Int]], _ counter: inout [Int]) -> Bool {
        if node == end {
            counter[node] += 1
            return true
        }
        for child in next[node] {
            guard child != parent else {continue}
            if dfs(child, node, end, next, &counter) {
                counter[node] += 1
                return true
            }
        }
        return false
    }


    private func dp(_ node: Int, _ parent: Int, _ price: [Int], _ next:[[Int]],_ counter: [Int]) -> Pair {
        var cost: Pair = (price[node] * counter[node], price[node] * counter[node] / 2)
        for child in next[node] {
            guard child != parent else {continue}
            let pair = dp(child,node,price,next,counter)
            cost.curNodeKeep += min(pair.curNodeHalf,pair.curNodeKeep)
            cost.curNodeHalf += pair.curNodeKeep
        }
        return cost
    }
}
