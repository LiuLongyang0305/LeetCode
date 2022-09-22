// https://leetcode.com/problems/count-days-spent-together/
class Solution {
    private let  days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    private let preffix = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365]
    func countDaysTogether(_ arriveAlice: String, _ leaveAlice: String, _ arriveBob: String, _ leaveBob: String) -> Int {
        let (aa,la) = (getDay(arriveAlice),getDay(leaveAlice))
        let (ab,lb) = (getDay(arriveBob),getDay(leaveBob))
        if aa < ab && la < ab {
            return 0
        }
        if ab < aa && lb < aa {
            return 0
        }
        let sortedDays = [aa,la,ab,lb].sorted()
        return sortedDays[2] - sortedDays[1] + 1
    }

    private func getDay(_ date: String) -> Int {
        let month = Int(date.prefix(2))!
        let day = Int(date.suffix(2))!
        return preffix[month - 1] + day
    }
}
