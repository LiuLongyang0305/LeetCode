// https://leetcode.com/problems/minimum-time-to-complete-trips/
class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        let sortedTime = time.sorted()
        
        
        
        func check(_ totalTime: Int) -> Bool {
            var cnt = 0
            for t in sortedTime {
                guard t <= totalTime else {break}
                cnt += totalTime / t
            }
            return cnt >= totalTrips
        }
        var left = sortedTime[0]
        var right = sortedTime[0] * totalTrips
        while left < right {
            let mid = (left + right) >> 1
            
            if check(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}
