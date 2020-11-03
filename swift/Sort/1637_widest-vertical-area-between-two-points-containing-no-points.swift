// https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points/
class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let sortedPoints = points.sorted { $0[0] < $1[0]}
        var ans = 0
        for i in 1..<points.count {
            ans = max(ans, sortedPoints[i][0] - sortedPoints[i - 1][0])
        }
        return ans
    }
}