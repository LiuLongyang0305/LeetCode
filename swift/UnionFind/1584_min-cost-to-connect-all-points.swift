// https://leetcode.com/problems/min-cost-to-connect-all-points/
class Solution {
    private struct Point{
        var x: Int
        var y: Int
        func caculateManhattanDistance(to another: Point) -> Int {
            return abs(x - another.x) + abs(another.y - y)
        }
    }
    private typealias Edge = (from: Int,to:Int,dis:Int)
    private var parent = [Int]()
    private var connectionsCnt = 0
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let pointsCopy = points.map { Point(x: $0[0], y: $0[1])}
        guard points.count > 1 else {
            return 0
        }
        guard points.count > 2 else {
            return pointsCopy[0].caculateManhattanDistance(to: pointsCopy[1])
        }
        let N = points.count
        self.parent = Array<Int>(0..<N)
        var edges = Array<Edge>()
        for i in 0..<N {
            var j = i + 1
            while j < N {
                edges.append((i,j,pointsCopy[i].caculateManhattanDistance(to: pointsCopy[j])))
                j += 1
            }
        }
        edges.sort { (e1, e2) -> Bool in
            return e1.dis < e2.dis
        }
        var ans = 0
        for edge in edges {
            guard connectionsCnt < (N - 1) else {
                break
            }
            let p1 = find(edge.from)
            let p2 = find(edge.to)
            if p1 != p2 {
                ans += edge.dis
                union(p1, p2)
            }
        }
        return ans
    }
    
    private func find(_ node: Int) -> Int {
        guard node != parent[node] else {
            return node
        }
        return find(parent[node])
    }
    private func union(_ first: Int, _ second: Int) {
        parent[first] = parent[second]
        connectionsCnt += 1
    }
}