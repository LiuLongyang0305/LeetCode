//https://leetcode.com/problems/minimum-area-rectangle-ii/
struct Point: Hashable {
    var x: Int
    var y: Int
    func toString() -> String {
        return "point:  (\(x),  \(y))"
    }
}
struct Vector{
    var x: Int
    var y: Int
    init(from: Point, to: Point) {
        self.x = to.x - from.x
        self.y = to.y - from.y
    }
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    var squreDistance : Int {
        return x * x + y * y
    }
    func multiply(other vec: Vector) -> Int {
        
        return x * vec.x + y * vec.y
    }
    func isVertical(with other: Vector) -> Bool {
        return multiply(other: other)  == 0
    }
    func add(other vec: Vector) -> Vector {
        return Vector(x: x + vec.x, y: y + vec.y)
    }
    func getToPoint(from: Point) -> Point {
        return Point(x: x + from.x, y: y + from.y)
    }
    func toString() -> String {
        return "vec: (\(x), \(y))   "
    }
}
class Solution {
    private var pointsSet = Set<Point>()
    private let doubleMax = Double(Int.max)
    private var calculateRectangles = Set<Set<Point>>()
    typealias ResultType = (area: Double,point: Point?)
    typealias Parameters = (first:Vector?,second:Vector?,third:Vector?,commonPoint: Point?)
    func minAreaFreeRect(_ points: [[Int]]) -> Double {
        guard points.count >= 4 else {
            return 0.0
        }
        var ans = doubleMax
        let pointsArr = [Point](points.map{Point(x: $0[0], y: $0[1])})
        pointsSet = Set<Point>(pointsArr)
        let length = points.count
        for i in 0..<(length - 2) {
            for j in (i + 1)..<(length - 1) {
                for k in (j + 1)..<length {
                    let points = Set<Point>([pointsArr[i], pointsArr[j], pointsArr[k]])
                    if !calculateRectangles.contains(points) {
                        ans = min(ans, getRectangleArea(pointsArr[i], pointsArr[j], pointsArr[k]))
                    }
                }
            }
        }
        return ans == doubleMax ? 0.0 : ans
    }
    
    private func getRectangleArea(_ first: Point,_ second:Point, _ third: Point) -> Double {
        
        let v1 = Vector(from: first, to: second)
        let v2 = Vector(from: first, to: third)
        let v3 = Vector(from: second, to: third)
        
        var  parameters: Parameters = (nil,nil,nil,nil)
        if v1.isVertical(with: v2) {
            if v3.squreDistance > v1.squreDistance && v3.squreDistance > v2.squreDistance {
                parameters = (v1,v2,v3,first)
            }
        }
        if  v1.isVertical(with: v3) {
            if v2.squreDistance > v1.squreDistance && v2.squreDistance > v3.squreDistance {
                parameters = (Vector(from: second, to: first),v3,v2,second)
            }
        }
        if v2.isVertical(with: v3) {
            if v1.squreDistance > v2.squreDistance && v1.squreDistance > v3.squreDistance {
                parameters = (Vector(from: third, to: first),Vector(from: third, to: second),v1,third)
            }
        }
        guard parameters.first != nil else {
            return doubleMax
        }
        let ans = area(parameters: parameters)
        guard let forth = ans.point else {
            return doubleMax
        }
        calculateRectangles.insert([first,second,third])
        calculateRectangles.insert([first,second,forth])
        calculateRectangles.insert([third,second,forth])
        calculateRectangles.insert([first,third,forth])
        return ans.area
    }
    
    private func area(parameters: Parameters) -> ResultType {
        guard let v1 = parameters.first, let v2 =  parameters.second,  let _ = parameters.third, let commonPoint = parameters.commonPoint else {
            return (doubleMax,nil)
        }
        let forthVec = v1.add(other: v2)
        let forthPoint = forthVec.getToPoint(from: commonPoint)
        guard pointsSet.contains(forthPoint) else {
            return (doubleMax,nil)
        }
        return (sqrt(Double(v1.squreDistance * v2.squreDistance)),forthPoint)
    }
}
Solution().minAreaFreeRect([[3,1],[1,1],[0,1],[2,1],[3,3],[3,2],[0,2],[2,3]])