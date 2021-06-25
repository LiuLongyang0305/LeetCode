// https://leetcode.com/problems/maximum-number-of-visible-points/
class Solution {
    
    func visiblePoints(_ points: [[Int]], _ angle: Int, _ location: [Int]) -> Int {
        
        var locationCnt = 0
        var angles = [Double]()
        for point in points {
            if point == location {
                locationCnt += 1
                continue
            }
            let t = getAngleOf(point, location)
            angles.append(t)
        }
        guard !angles.isEmpty else {
            return points.count
        }
        angles.sort()
        let angleDuble = Double(angle)

        let angleLimit =  angles.last! + angleDuble
        var nextAngles = [Double]()
        for ang in angles {
            guard ang + 360 <= angleLimit else {
                break
            }
            nextAngles.append(ang + 360)
        }
        angles.append(contentsOf: nextAngles)
        let N = angles.count
        var ans = 0
        var left = 0
        var right = 0
        while left < N {
            while right < N && angles[right] - angles[left] <= angleDuble {
                right += 1
            }
            ans = max(ans, right - left)
            left += 1
        }
        return ans + locationCnt
    }
    private func getAngleOf(_ point: [Int],_ original: [Int]) -> Double {
        guard point[0] != original[0] else {
            return point[1] < original[1] ? -90.0 : 90.0
        }
        guard point[1] != original[1] else {
            return point[0] < original[0] ? 180 : 0
        }
        let tempAngle = atan(Double(point[1] - original[1]) / Double(point[0] - original[0])) * 180.0 / Double.pi
        return point[0] < original[0] ? (180 + tempAngle) : tempAngle
    }
}