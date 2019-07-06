//https://leetcode.com/problems/valid-boomerang/
class Solution {
    func isBoomerang(_ points: [[Int]]) -> Bool {
        let p12P2 = [points[1][0] - points[0][0],points[1][1] - points[0][1]]
        let p12P3 = [points[2][0] - points[0][0],points[2][1] - points[0][1]]
        return  p12P2[0] * p12P3[1] == p12P2[1] * p12P3[0]
    }
}