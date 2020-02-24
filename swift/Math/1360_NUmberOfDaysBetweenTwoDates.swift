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
 

 class Solution {
    private let daysEachCommonYear = 365
    private let leapYears: Set<Int> = [1972, 1976, 1980, 1984, 1988, 1992, 1996, 2000, 2004, 2008, 2012, 2016, 2020, 2024, 2028, 2032, 2036, 2040, 2044, 2048, 2052, 2056, 2060, 2064, 2068, 2072, 2076, 2080, 2084, 2088, 2092, 2096]
    private let daysEachMonth = [0,31,28,31,30,31,30,31,31,30,31,30,31]
    private typealias MyDate = (year:Int,month:Int,day:Int)
    func daysBetweenDates(_ date1: String, _ date2: String) -> Int {
        
        func parseStrToMyDate(_ date: String) -> MyDate {
            let arr = date.components(separatedBy: CharacterSet(charactersIn: "-")).map {Int($0)!}
            return (arr[0],arr[1],arr[2])
        }
        func CountDaysSince1970(_ date: MyDate) -> Int {
            var ans = 0
            //Year
            ans += (date.year - 1970 ) * daysEachCommonYear + leapYears.intersection(Set<Int>(1970..<date.year)).count
            //Month
            if date.month > 1 {
                for month in 1..<date.month {
                    ans += daysEachMonth[month]
                }
                if date.month > 2 && leapYears.contains(date.year) {
                    ans += 1
                }
            }
            //Day
            ans += date.day
            return ans
        }
        return abs(CountDaysSince1970(parseStrToMyDate(date1)) - CountDaysSince1970(parseStrToMyDate(date2)))
    }
 }


