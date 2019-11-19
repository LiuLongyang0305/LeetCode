
//https://leetcode.com/problems/rectangle-area/submissions/
class Solution {
    struct Rectangle {
        var xLeftDown: Int
        var yLeftDown: Int
        var xRightUp: Int
        var yRightUp: Int
        var area: Int {
            return (xRightUp - xLeftDown) * (yRightUp - yLeftDown)
        }
        init(_ xLeftDown: Int, _ yLeftDown: Int, _ xRightUp:  Int , _ yRightUp: Int) {
            self.yLeftDown = yLeftDown
            self.yRightUp = yRightUp
            self.xLeftDown = xLeftDown
            self.xRightUp = xRightUp
        }
        func overlap(other rectangle: Rectangle) -> Int {
            let xRightUpMin =  min(xRightUp, rectangle.xRightUp)
            let xLeftDownMax = max(xLeftDown, rectangle.xLeftDown)
            let yRightUpMin =  min(yRightUp,rectangle.yRightUp)
            let yLeftDownMax = max(yLeftDown, rectangle.yLeftDown)
            
            guard xRightUpMin  > xLeftDownMax &&  yRightUpMin > yLeftDownMax else {
                return 0
            }
            return (xRightUpMin - xLeftDownMax) * (yRightUpMin - yLeftDownMax)
        }
        func totalArea(other rectangle: Rectangle) -> Int {
            return area + rectangle.area - overlap(other: rectangle)
        }
    }
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        return Rectangle(A, B, C, D).totalArea(other: Rectangle(E, F, G, H))
    }
}