// https://leetcode-cn.com/problems/intersection-lcci/
struct Vector2 {
    var x: Double
    var y: Double
    func isParellTo(another vector: Vector2) -> Bool {
        return fabs(x * vector.y - y * vector.x) <=  1e-6
    }
    func isVerticalTo(another vector: Vector2) -> Bool {
        return fabs(x * vector.x  + y *  vector.y) <= 1e-6
    }
    func multiply(another vector: Vector2) -> Double {
        return x * vector.x + y * vector.y
    }
}
struct Line {
    var dir: Vector2
    var startPoint: [Double]
    var endPoint: [Double]
    var k: Double?
    var squreDistance:  Double {
        return dir.x * dir.x + dir.y * dir.y
    }
    init(start: [Int], end: [Int]) {
        let  sortedPoints  = [start,end].sorted { (p1, p2) -> Bool in
            if p1[0] == p2[0] {
                return  p1[1] < p2[1]
            }
            return p1[0] < p2[0]
        }
        self.startPoint = sortedPoints[0].map({ Double($0)})
        self.endPoint = sortedPoints[1].map({ Double($0)})
        self.dir = Vector2(x: self.endPoint[0] -  self.startPoint[0], y: self.endPoint[1] -  self.startPoint[1])
        if startPoint[0] != endPoint[0] {
            k = dir.y / dir.x
        }
    }
}
class Solution {
    func intersection(_ start1: [Int], _ end1: [Int], _ start2: [Int], _ end2: [Int]) -> [Double] {
        
        let line1 = Line(start: start1, end: end1)
        let line2 = Line(start: start2, end: end2)
        //完全重合
        guard line1.startPoint != line2.startPoint || line1.endPoint != line2.endPoint else {
            return line2.startPoint
        }
        if line1.dir.isParellTo(another: line2.dir)  {
            var line3 = Line(start: start1, end: start2)
            if start2  ==  start1 {
                line3 = Line(start: start1, end: end2)
            }
            //所在直线不重合
            if !line2.dir.isParellTo(another: line3.dir) {
                return  []
            }
            
            //所在直线重合
            let v1 = Vector2(x: Double(start2[0] - start1[0]), y: Double(start2[1] - start1[1]))
            let v2 = Vector2(x: Double(start2[0] - end1[0]), y: Double(start2[1] - end1[1]))
            guard v1.multiply(another: v2) <= 0 else {
                return []
            }
            let line4 = Line(start: start1, end: start2)
            return  line4.endPoint
        }
        
        // 其中一个与y轴平行
        let yDir = Vector2(x: 0, y: 1)
        if line2.dir.isParellTo(another: yDir) || line1.dir.isParellTo(another: yDir) {
            //  x = b
            let parrealToY = line1.dir.isParellTo(another: yDir) ? line1 : line2
            //y = kx + b
            let another = line1.dir.isParellTo(another: yDir) ? line2 : line1
            let x = parrealToY.startPoint[0]
            if another.startPoint[0] > x || another.endPoint[0] < x {
                return []
            }
            let y = another.k! * (x - another.startPoint[0]) + another.startPoint[1]
            return [x,y]
        }
        //y = kx + b
        let b1 = line1.startPoint[1] - line1.k! * line1.startPoint[0]
        let b2 = line2.startPoint[1]  - line2.k! * line2.startPoint[0]
        let x = (b2  - b1) / (line1.k! - line2.k!)
        //判断焦点在线段上
        guard x >= line1.startPoint[0] && x <= line1.endPoint[0] && x >= line2.startPoint[0] && x <= line2.endPoint[0] else {
            return []
        }
        let y = line1.k! * x + b1
        return  [x,y]
    }
}

