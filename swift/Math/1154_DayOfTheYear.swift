//https://leetcode.com/problems/day-of-the-year/
class Solution {
    func dayOfYear(_ date: String) -> Int {
        let parts =  date.components(separatedBy: CharacterSet(charactersIn: "-"))
        let days = [31,28,31,30,31,30,31,31,30,31,30,31]
        let dateNumer = parts.map { (str) -> Int in
            Int(str)!
        }
        var totalDays = 0
        for month in 1..<dateNumer[1]{
            if month == 2 {
                totalDays += (isLeapYear(year: dateNumer[0]) ? 29: 28)
                continue
            }
            totalDays += days[month  - 1]
        }
        totalDays += dateNumer[2]
        return totalDays
    }
    private func isLeapYear(year: Int) -> Bool {
        return (year % 100 != 0 && year % 4 == 0) || (year % 400 == 0 )
    }
}