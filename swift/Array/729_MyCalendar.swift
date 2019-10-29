//https://leetcode.com/problems/my-calendar-i/
class MyCalendar {

    typealias CalendarRange = (start: Int, end: Int)
    private var calendars = [CalendarRange]()
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        let currentCalendar = (start,end)
        if calendars.isEmpty {
            calendars.append(currentCalendar)
            return true
        }
        if end <= calendars[0].start {
            calendars.insert(currentCalendar, at: 0)
            return true
        }
        if start >= calendars.last!.end {
            calendars.append(currentCalendar)
            return true
        }
        if calendars.count == 1 {
            return false
        }
        for i in 0..<(calendars.count - 1) {
            if start >= calendars[i].end && end <= calendars[i + 1].start {
                calendars.insert(currentCalendar, at: i + 1)
                return true
            }
        }
        return false
    }
}
/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */