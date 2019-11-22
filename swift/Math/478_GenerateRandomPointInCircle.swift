//https://leetcode.com/problems/generate-random-point-in-a-circle/
class Solution {

    private var radius: Double = 0.0
    private var x_center: Double = 0.0
    private var y_center: Double = 0.0
    private let closedRange = ClosedRange<Double>(uncheckedBounds: (lower: 0.0, upper: 1.0))
    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        self.x_center = x_center
        self.y_center = y_center
    }
    
    func randPoint() -> [Double] {
        let x0 = -radius
        let y0 = -radius
        while true {
            let x = x0 + Double.random(in: closedRange) * 2.0 * radius
            let y = y0 + Double.random(in: closedRange) * 2.0 * radius
            if pow(x, 2.0) + pow(y, 2.0) <= pow(radius, 2.0) {
                return  [x_center + x, y_center +  y]
            }
        }
    }
}

