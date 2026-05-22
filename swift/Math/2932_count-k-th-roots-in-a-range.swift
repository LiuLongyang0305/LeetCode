//https://leetcode.cn/problems/count-k-th-roots-in-a-range/
extension Double {
    func isAlmostEqual(to other: Self, tolerance: Self = Self(1e-9) ) -> Bool {
        abs(self - other) < tolerance
    }
}
class Solution {
    func countKthRoots(_ l: Int, _ r: Int, _ k: Int) -> Int {
        var minValDouble = pow(Double(l), 1.0 / Double(k))//向上取整
        var maxValDouble = pow(Double(r), 1.0 / Double(k))//向下取整
        if minValDouble.isAlmostEqual(to: ceil(minValDouble) - 1.0) {
            minValDouble = ceil(minValDouble) - 1.0
        } else {
            minValDouble = ceil(minValDouble)
        }
        if maxValDouble.isAlmostEqual(to: floor(maxValDouble) + 1.0) {
            maxValDouble = floor(maxValDouble) + 1.0
        } else {
             maxValDouble = floor(maxValDouble)
        }
        // print("\(minValDouble)  \(maxValDouble)")
        return max(0,Int(maxValDouble) - Int(minValDouble) + 1)
    }
}

