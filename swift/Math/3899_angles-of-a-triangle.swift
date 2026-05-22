//https://leetcode.cn/problems/angles-of-a-triangle/
class Solution {
    func internalAngles(_ sides: [Int]) -> [Double] {
        let ss = sides.sorted().map { Double($0)}
        guard ss[0] + ss[1] > ss[2] else {return []}
        var sb = [Double]()
        let sss = ss.map { $0 * $0}
        sb.append(acos((sss[1] + sss[2] - sss[0]) / (2 * ss[1] * ss[2])) * 180.0 / Double.pi)
        sb.append(acos((sss[0] + sss[2] - sss[1]) / (2 * ss[0] * ss[2])) * 180.0 / Double.pi)
        sb.append(acos((sss[0] + sss[1] - sss[2]) / (2 * ss[0] * ss[1])) * 180.0 / Double.pi)
        return sb
    }
}
