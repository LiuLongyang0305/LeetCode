//https://leetcode.cn/problems/minimum-generations-to-target-point/
class Solution {
    private struct Point:Hashable{
        var x: Int
        var y: Int
        var z: Int
    }
    func minGenerations(_ points: [[Int]], _ target: [Int]) -> Int {
        var pointsSet = Set<Point>(points.map({ Point(x: $0[0], y: $0[1], z: $0[2])}))
        let target = Point(x: target[0], y: target[1], z: target[2])
        var depth = 0
        var lastLevelPointSets = Set<Point>()

        while pointsSet.hashValue != lastLevelPointSets.hashValue {
            guard !pointsSet.contains(target) else {return depth}
            depth += 1
            var newLevelPointsSet = Set<Point>()
            for p1 in pointsSet {
                for p2 in pointsSet {
                    guard p1 != p2 else {continue}
                    newLevelPointsSet.insert(Point(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2, z: (p1.z + p2.z) / 2))
                }
            }
            lastLevelPointSets = pointsSet
            pointsSet.formUnion(newLevelPointsSet)
        }
        return -1
    }
}
