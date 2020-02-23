// https://leetcode.com/problems/number-of-days-between-two-dates/
class Solution {
    private let SECONDS_EACH_DAY = 86400
    func daysBetweenDates(_ date1: String, _ date2: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let formatedDate1 = dateFormatter.date(from: date1) , let formatedDate2 = dateFormatter.date(from: date2)else {
            return -1
        }
        return abs(Int(formatedDate2.timeIntervalSince(formatedDate1))) / SECONDS_EACH_DAY
    }
 }
 