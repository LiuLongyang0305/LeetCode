//https://leetcode.com/problems/maximum-area-rectangle-with-point-constraints-i/
class Solution {

    private struct Point: Hashable {
        var x: Int
        var y: Int
    }
    func maxRectangleArea(_ points: [[Int]]) -> Int {
        let sortedPs = points.map {Point(x: $0[0], y: $0[1])}.sorted { p1, p2 in
            p1.x < p2.x
        }
        // print(sortedPs)
        let N = points.count
        let pointsSet = Set<Point>(sortedPs)


        func caculate(_ fp: Point, _ sp: Point) -> Int {
            guard fp.x != sp.x && fp.y != sp.y else {return Int.min}

            var ans = Int.min

            let np1 = Point(x: fp.x, y: sp.y)
            let np2 = Point(x: sp.x, y: fp.y)

            guard pointsSet.contains(np1) && pointsSet.contains(np2) else {
                return Int.min
            }

            // print("\(fp)  \(sp) \(np1) \(np2)")
            let minX = min(fp.x,sp.x), maxX = max(fp.x,sp.x)
            let minY = min(fp.y,sp.y),maxY = max(fp.y,sp.y)

            for p in sortedPs {
                guard p != fp && p != sp && p != np1 && p != np2  else {continue}
                if p.x >= minX && p.x <= maxX && p.y >= minY && p.y <= maxY {
                    return Int.min
                }
            }

            return (maxX - minX) * (maxY - minY)
        }


        var ans = 0
        for i in 0..<N {
            var j = i + 1
            while j < N {
                ans = max(ans,caculate(sortedPs[i],sortedPs[j]))
                j += 1
            }
        }
        return ans == 0 ? -1 : ans
    }
}
