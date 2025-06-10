// https://leetcode.com/problems/find-the-largest-area-of-square-inside-two-rectangles/


class Solution {
    private struct Point: CustomDebugStringConvertible {
        var debugDescription: String {
            return "Point(x:\(x),y:\(y)"
        }

        var x: Int
        var y: Int
    }
    private struct Rectangle:CustomDebugStringConvertible {
        var debugDescription: String {
            return "Rectangle(bottomLeft:\(bottomLeft),topRight:\(topRight))"
        }

        var bottomLeft: Point
        var topRight: Point
    }


    private func isOverlaped(first: Rectangle, second: Rectangle) -> Bool {
        let isOverlapedX = max(first.bottomLeft.x,second.bottomLeft.x) < min(first.topRight.x,second.topRight.x)
        let isOverlapedY = max(first.bottomLeft.y,second.bottomLeft.y) < min(first.topRight.y,second.topRight.y)
        return isOverlapedX && isOverlapedY
    }

    private func getOverlapedRectangle(first: Rectangle, second: Rectangle) -> Rectangle? {
        guard isOverlaped(first: first, second: second) else {return nil}
        return Rectangle(bottomLeft: Point(x: max(first.bottomLeft.x,second.bottomLeft.x), y: max(first.bottomLeft.y,second.bottomLeft.y)), topRight: Point(x: min(first.topRight.x,second.topRight.x), y: min(first.topRight.y,second.topRight.y)))
    }

    private func getIntersectionMaxSqureArea(first: Rectangle, second: Rectangle)  -> Int {
        guard let rec = getOverlapedRectangle(first: first, second: second) else {return 0}
        let edgeLength = min((rec.topRight.x - rec.bottomLeft.x),(rec.topRight.y - rec.bottomLeft.y))
        // print("\(#function) \(first)  \(second) area = \(edgeLength * edgeLength)")
        return edgeLength * edgeLength
    }

    func largestSquareArea(_ bottomLeft: [[Int]], _ topRight: [[Int]]) -> Int {
        let M = bottomLeft.count
        let rectangles = (0..<M).map { i in
            return Rectangle(bottomLeft: Point(x: bottomLeft[i][0], y: bottomLeft[i][1]), topRight: Point(x: topRight[i][0], y: topRight[i][1]))
        }

        var ans = 0
        for i in 0..<M {
            var j = i + 1
            while j < M {
                ans = max(ans, getIntersectionMaxSqureArea(first: rectangles[i], second: rectangles[j]))
                j += 1
            }
        }
        return ans
    }
}


