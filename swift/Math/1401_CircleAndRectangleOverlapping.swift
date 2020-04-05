// https://leetcode.com/problems/circle-and-rectangle-overlapping/
extension Int {
    var squre: Int {
        return self * self
    }
}
class Solution {
    func checkOverlap(_ radius: Int, _ x_center: Int, _ y_center: Int, _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Bool {
        if x_center >= x1 - radius && x_center <= x2 + radius && y_center >= y1 && y_center <= y2 {
            return true
        }
        if x_center >= x1 && x_center <= x2 && y_center <= y2 + radius && y_center >= y1 + radius {
            return true
        }
        return  min((x1 - x_center).squre + (y1 - y_center).squre, (x_center - x2).squre + (y_center - y2).squre,(x_center - x1).squre + (y_center - y2).squre,(x2 - x_center).squre + (y1 - y_center).squre ) <= radius.squre
    }
    
}

