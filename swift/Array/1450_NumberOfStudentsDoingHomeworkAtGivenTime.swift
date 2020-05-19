// https://leetcode.com/problems/number-of-students-doing-homework-at-a-given-time/
class Solution {
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        var ans = 0
        for t in startTime {
            if t <= queryTime {
                ans += 1
            }
        }
        for t in endTime {
            if t < queryTime {
                ans -= 1
            }
        }
        return ans
    }
}