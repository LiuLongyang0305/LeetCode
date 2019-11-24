//https://leetcode.com/problems/minimum-time-visiting-all-points/
 class Solution {
     func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        guard points.count > 1 else {
            return 0
        }
        var ans = 0
        for i in 0..<(points.count - 1) {
            ans += max(abs(points[i + 1][0] - points[i][0]), abs(points[i + 1][1] - points[i][1]))
        }
         return ans
     }
 }