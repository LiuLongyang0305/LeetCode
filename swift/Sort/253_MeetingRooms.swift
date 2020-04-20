// https://leetcode.com/problems/meeting-rooms-ii/
class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var map = [Int:Int]()
        intervals.forEach { (interval) in
            map.updateValue((map[interval[0]] ?? 0) + 1, forKey: interval[0])
            map.updateValue((map[interval[1]] ?? 0) - 1, forKey: interval[1])
        }
        var ans = 0
        let sortedMap = map.sorted { (dic, dic1) -> Bool in
            dic.key < dic1.key
        }
        var total = 0
        for (_,cnt) in sortedMap {
            total += cnt
            ans = max(total, ans)
        }
        return ans
    }
}
