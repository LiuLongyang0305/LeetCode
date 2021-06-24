// https://leetcode.com/problems/max-points-on-a-line/
class Solution {
    private struct Point {
        var x: Int
        var y: Int
    }
    func maxPoints(_ ps: [[Int]]) -> Int {
        guard ps.count > 2 else {
            return ps.count
        }
        let points = ps.map {Point(x: $0[0], y: $0[1])}
        let sortedPoints = points.sorted { p1, p2 in
            p1.x == p2.x ? (p1.y < p2.y) : (p1.x < p2.x)
        }
        var ans = Int.min
        let N = points.count
        for startIdx in 0..<N {
            let startPoint = sortedPoints[startIdx]
            var endIdx = startIdx + 1
            while endIdx < N {
                
                var pointsCount = 2

                let dx = sortedPoints[endIdx].x - startPoint.x
                let dy = sortedPoints[endIdx].y - startPoint.y
                var idx = endIdx + 1
                while idx < N {
                    if (sortedPoints[idx].x - startPoint.x) * dy == (sortedPoints[idx].y - startPoint.y) * dx {
                        pointsCount += 1
                    }
                    idx += 1
                }
                ans = max(ans, pointsCount)
                endIdx += 1
            }
        }
        return ans
    }
}

