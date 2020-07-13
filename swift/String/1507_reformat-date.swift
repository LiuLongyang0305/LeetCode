// https://leetcode.com/problems/reformat-date/
class Solution {
    func reformatDate(_ date: String) -> String {
        let months = ["","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let compoments = date.split(separator: " ").map {String($0)}
        let monthIndex = months.firstIndex(of: compoments[1])!
        let monthStr = (monthIndex >= 10 ? "" : "0") + "\(monthIndex)"
        var dayStr = String(compoments[0].prefix(2))
        if dayStr.last!.isLetter {
            dayStr.removeLast()
            dayStr.insert("0", at: dayStr.startIndex)
        }
        return "\(compoments[2])-\(monthStr)-\(dayStr)"
    }
}