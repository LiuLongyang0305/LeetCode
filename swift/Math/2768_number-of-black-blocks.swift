//https://leetcode.com/problems/number-of-black-blocks/
class Solution {
    private struct Point: Hashable {
        var x: Int
        var y: Int
    }
    func countBlackBlocks(_ m: Int, _ n: Int, _ coordinates: [[Int]]) -> [Int] {
        let points = coordinates.map { Point(x: $0[0], y: $0[1])}
        let pointsSet = Set(points)
        var sets = [Set<Point>](repeating: [], count: 5)
        for point in points {
            for (dx,dy) in [(0,0),(0,-1),(-1,0),(-1,-1)] {
                let leftTop = Point(x: point.x + dx, y: point.y + dy)
                let cnt = counter(leftTop, pointsSet, m, n)
                if cnt > 0 {
                    sets[cnt].insert(leftTop)
                }
            }
        }
        var ans = sets.map { $0.count}
        ans[0] = (m - 1) * (n - 1) - ans[1] - ans[2] - ans[3] - ans[4]
        return ans
    }

    private func counter(_ leftTop: Point, _ pointSets: Set<Point>, _ m: Int, _ n: Int) -> Int {
        var ans = 0
        for (dx,dy) in [(0,0),(1,0),(0,1),(1,1)] {
            let newP = Point(x: leftTop.x + dx, y: leftTop.y + dy)
            guard valid(newP, m, n) else {return -1}
            if pointSets.contains(newP) {
                ans += 1
            }
        }
        return ans
    }

    private func valid(_ point: Point, _ m: Int, _ n: Int) -> Bool {

        return point.x >= 0 && point.x < m && point.y >= 0 && point.y < n
    }
}
