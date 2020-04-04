// https://leetcode.com/problems/meeting-rooms/
class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        var map = [Int:Int]()
        for interval in intervals {
            map.updateValue((map[interval[0]] ?? 0 ) + 1, forKey: interval[0])
            map.updateValue((map[interval[1]] ?? 0) - 1, forKey: interval[1])
        }
        let sortedMap = map.sorted { (t1, t2) -> Bool in
            return t1.key < t2.key
        }
        var currentTimeMeetings = 0
        for (_,val) in sortedMap {
            currentTimeMeetings += val
            if currentTimeMeetings > 1 {
                return false
            }
        }
        return true
    }
}
