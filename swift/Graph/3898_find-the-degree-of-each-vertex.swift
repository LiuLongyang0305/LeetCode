// https://leetcode.cn/problems/find-the-degree-of-each-vertex/
class Solution {
    func findDegrees(_ matrix: [[Int]]) -> [Int] {
        return matrix.map { $0.reduce(0) { $0 + $1}}
    }
}
