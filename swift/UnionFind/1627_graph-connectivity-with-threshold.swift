// https://leetcode.com/problems/graph-connectivity-with-threshold/
class Solution {
    func areConnected(_ n: Int, _ threshold: Int, _ queries: [[Int]]) -> [Bool] {
        guard threshold > 0 else {
            return Array<Bool>(repeating: true, count: queries.count)
        }
        var fa = [Int](0...n)
        func find(_ node: Int) -> Int {
            if fa[node] == node {
                return node
            }
            fa[node] = find(fa[node])
            return fa[node]
        }
        for first in (threshold + 1)...n {
            var second = first * 2
            while second <= n {
                let f = find(first)
                let s = find(second)
                if f != s {
                    fa[s] = f
                }
                second += first
            }
        }
        return queries.map {find($0[0]) == find($0[1])}
    }
}

