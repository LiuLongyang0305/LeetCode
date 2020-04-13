// https://leetcode.com/problems/convex-polygon/
class Solution {
    private struct Point {
        var x: Int
        var y: Int
        init(_ arr: [Int]) {
            x = arr[0]
            y = arr[1]
        }
    }
    private struct Vector2D {
        var x: Int
        var y: Int
        init(_ from: Point, _ to: Point) {
            x = to.x - from.x
            y = to.y - from.y
        }
        
        static func *( lhs: Vector2D, rhs: Vector2D) -> Int {
            return lhs.x * rhs.y - lhs.y * rhs.x
        }
    }
    func isConvex(_ points: [[Int]]) -> Bool {
        let pointsCopy = points.map {Point($0)}
        let N = pointsCopy.count
        var cur = 0
        var pre = 0
        for i in 0..<N {
            let v1 = Vector2D(pointsCopy[i], pointsCopy[(i + 1) % N])
            let v2 = Vector2D(pointsCopy[i],pointsCopy[(i + 2) % N])
            cur = v1 * v2
            if cur != 0 {
                guard cur * pre >= 0 else {
                    return false
                }
                pre = cur
            }
        }
        return true
    }
}
