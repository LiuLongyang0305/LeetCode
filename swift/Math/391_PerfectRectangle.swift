// https://leetcode.com/problems/perfect-rectangle/
class Solution {
    private struct Point: Hashable {
        var x: Int
        var y: Int
    }
    func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
        var left = Int.max
        var right = -1
        var up = -1
        var down = Int.max
        var totalArea = 0
        
        var pointsSet = Set<Point>()
        
        for rectangle in rectangles {
            totalArea += (rectangle[2] - rectangle[0]) * (rectangle[3] - rectangle[1])
            left = min(left, rectangle[0])
            down = min(down, rectangle[1])
            up = max(up, rectangle[3])
            right = max(right, rectangle[2])
        }
        guard  totalArea == (right - left) * (up - down) else {
            return false
        }
        for rectangle in rectangles {
            let points = [Point(x: rectangle[0], y: rectangle[1]),Point(x: rectangle[1], y: rectangle[3]),Point(x: rectangle[2], y: rectangle[1]),Point(x: rectangle[2], y: rectangle[3])]
            for p in points {
                if pointsSet.contains(p) {
                    pointsSet.remove(p)
                } else {
                    pointsSet.insert(p)
                }
            }
        }

        return Set<Point>([Point(x: left, y: down),Point(x: left, y: up),Point(x: right, y: down),Point(x: right, y: up)]) == pointsSet
    }
}
let rectangles = [[0,0,4,1],[7,0,8,2],[6,2,8,3],[5,1,6,3],[4,0,5,1],[6,0,7,2],[4,2,5,3],[2,1,4,3],[0,1,2,2],[0,2,2,3],[4,1,5,2],[5,0,6,1]]
Solution().isRectangleCover(rectangles)
