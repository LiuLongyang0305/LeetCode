// https://leetcode.com/problems/maximum-number-of-darts-inside-of-a-circular-dartboard/
class Solution {
    private struct Point {
        var x: Double
        var y: Double
        func distance(to  another: Point) -> Double {
            return sqrt((x - another.x) * (x - another.x) + (y - another.y) * (y - another.y ))
        }
    }
    func numPoints(_ points: [[Int]], _ r: Int) -> Int {
        guard points.count > 1 else {
            return points.count
        }
        let doublePoints = points.map {$0.map {Double($0)}}.map { (arr) -> Point in
            Point(x: arr[0], y: arr[1])
        }
        let doubleRadius = Double(r)
        let error = 1e-6

        guard points.count > 2 else {
            return  doublePoints[0].distance(to: doublePoints[1]) - 2.0 * doubleRadius <= error ? 2 : 1
        }
        let N = points.count
        func count(center: Point) -> Int {
            var cnt = 0
            for point in doublePoints {
                if center.distance(to: point) - doubleRadius <= error {
                    cnt += 1
                }
            }
            // print("\(center)  \(cnt)")
            return cnt
        }
        func getCenters(_ one: Point, _ another: Point) -> (Point,Point) {
            let mid = Point(x: (one.x + another.x) / 2.0, y: (one.y + another.y) / 2.0)
            let dis1 = mid.distance(to: one)
            let dis2 = sqrt(doubleRadius * doubleRadius - dis1 * dis1)
            var dirX = 0.0
            var dirY = 0.0
            if one.x == another.x {
                dirY = 1.0
            } else if one.y == another.y {
                dirX = 1.0
            } else {
                let dx = one.x - another.x
                let dy = one.y - another.y
                let dis3 = Point(x: 0, y: 0).distance(to: Point(x: dx, y: dy))
                dirX = dy / dis3
                dirY = -dx / dis3
            }
            
            return (Point(x: mid.x + dis2 * dirX, y: mid.y + dis2 * dirY),Point(x: mid.x - dis2 * dirX, y: mid.y - dis2 * dirY))
        }
        var ans = Int.min
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                let dis = doublePoints[i].distance(to: doublePoints[j])
                guard dis - 2.0 * doubleRadius <= error else {
                    continue
                }
                let centers = getCenters(doublePoints[i], doublePoints[j])
                ans = max(ans, count(center: centers.0),count(center: centers.1))
            }
        }
        return max(1,ans)
    }
}