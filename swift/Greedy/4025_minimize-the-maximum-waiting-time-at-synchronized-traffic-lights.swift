    //https://leetcode.cn/problems/minimize-the-maximum-waiting-time-at-synchronized-traffic-lights/
    class Solution {
        func minPenalty(_ period: Int, _ lights: [Int], _ arrivalTime: [Int]) -> Int {
            let mx = lights.max()!
            var sb = 0
            for var t in arrivalTime {
                t %= period
                if t >= mx {
                    sb = max(sb,period - t)
                }
            }
            return sb
        }
    }
