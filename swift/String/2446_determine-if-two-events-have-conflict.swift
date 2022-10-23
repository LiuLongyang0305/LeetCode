// https://leetcode.com/problems/determine-if-two-events-have-conflict/
class Solution {
    func haveConflict(_ event1: [String], _ event2: [String]) -> Bool {
       let (s1,e1) = (getTime(event1[0]),getTime(event1[1]))
       let (s2,e2) = (getTime(event2[0]),getTime(event2[1]))
       return !((s1 < s2 && e1 < s2 ) || (s2 < s1 && e2 < s1))

    }

    private func getTime(_ timeStr: String) -> Int {
        let hour = Int(timeStr.prefix(2))!
        let minute = Int(timeStr.suffix(2))!
        return hour * 60 + minute
    }
}
class Solution1 {
    func haveConflict(_ event1: [String], _ event2: [String]) -> Bool {

        return !(event1[1] < event2[0] || event2[1] < event1[0])

    }
}