// https://leetcode.com/problems/max-points-on-a-line/
class Solution {
    private struct Point: Hashable {
        var x: Int
        var y: Int
    }
    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count > 2 else {
            return points.count
        }
        var pointsCounter = [Point:Int]()
        points.forEach {  pointsCounter[Point(x: $0[0], y: $0[1]), default: 0] += 1}
        var ans = Int.min
        let uniquePoints = Array<Point>(pointsCounter.keys)
        let N = uniquePoints.count
        guard N > 1 else {
            return points.count
        }
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                var cnt = pointsCounter[uniquePoints[i]]! + pointsCounter[uniquePoints[j]]!
                var k = j + 1
                while k < N {
                    let v1 = (uniquePoints[i].x - uniquePoints[j].x,uniquePoints[i].y - uniquePoints[j].y)
                    let v2 = (uniquePoints[i].x - uniquePoints[k].x,uniquePoints[i].y - uniquePoints[k].y)
                    if v1.0 * v2.1 == v1.1 * v2.0 {
                        cnt += pointsCounter[uniquePoints[k]]!
                    }
                    k += 1
                }
                ans = max(ans,cnt)
            }
        }
        return ans
    }
}