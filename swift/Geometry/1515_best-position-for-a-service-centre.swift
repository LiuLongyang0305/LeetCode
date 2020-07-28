// https://leetcode.com/problems/best-position-for-a-service-centre/
class Solution {
    private struct Point {
        var x: Double
        var y: Double
    }
    private func square(_ x: Double) -> Double {
        return x * x
    }
    private func distance(from p: Point, to q: Point) -> Double {
        return sqrt(square(p.x - q.x) + square(p.y - q.y))
    }
    private func check(_ points: [Point], _ center: Point) -> Double {
        return points.reduce(0.0) { $0 + distance(from: $1, to: center)}
    }
    private func getOriginalCenter(_ points: [Point]) -> Point {
        let N = points.count
        var center = Point(x: 0, y: 0)
        points.forEach { (p) in
            center.x += p.x
            center.y += p.y
        }
        center.x /= Double(N)
        center.y /= Double(N)
        return center
    }
    private let error = 1e-6
    private typealias Direction = (dx:Double,dy:Double)
    private let directions: [Direction] = [(1,0),(-1,0),(0,1),(0,-1)]
    func getMinDistSum(_ positions: [[Int]]) -> Double {
        let points = positions.map {Point(x: Double($0[0]), y: Double($0[1]))}
        var center = getOriginalCenter(points)
        var step = 50.0
        while step > error {
            var flag = false
            let currentDistanceSum = check(points, center)
            for dir in directions {
                let nextCenter = Point(x: center.x + dir.dx * step , y: center.y + dir.dy * step)
                if check(points, nextCenter) < currentDistanceSum {
                    center = nextCenter
                    flag = true
                }
            }
            if !flag {
                step /= 2.0
            }
        }
        return check(points, center)
    }
}

