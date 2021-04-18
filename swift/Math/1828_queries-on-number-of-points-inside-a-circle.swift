// https://leetcode.com/problems/queries-on-number-of-points-inside-a-circle/
class Solution {
    private struct Point: Hashable {
        var x: Int
        var y: Int
        func squreDistance(to other: Point) -> Int {
            let dx = x - other.x
            let dy = y - other.y
            return dx * dx  + dy  * dy
        }
    }
    func countPoints(_ ps: [[Int]], _ queries: [[Int]]) -> [Int] {
        var points = [Point:Int]()
        for p in ps {
            points[Point(x: p[0], y: p[1]),default: 0 ] += 1
        }
        var ans = [Int]()
        for query in queries {
            let centre = Point(x: query[0], y: query[1])
            let limit = query[2] * query[2]
            var cnt = 0
            for (p,c) in points {
                if centre.squreDistance(to: p) <= limit {
                    cnt += c
                }
            }
            ans.append(cnt)
        }
        return ans
    }
}