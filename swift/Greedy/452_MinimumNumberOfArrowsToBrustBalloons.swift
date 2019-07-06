//https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let numberOfBall = points.count
        if numberOfBall == 0 {
            return 0
        }
        let sortedPoints = points.sorted { (point1, point2) -> Bool in
            point1[1] < point2[1]
        }
        print(sortedPoints)
        var ans = 1
        var arrowPosition = sortedPoints[0][1]
        for i in 0..<sortedPoints.count {
            if sortedPoints[i][0] > arrowPosition {
                ans += 1
                arrowPosition = sortedPoints[i][1]
            }
        }
        return ans
    }
}