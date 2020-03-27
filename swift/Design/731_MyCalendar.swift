// https://leetcode.com/problems/my-calendar-ii/
class MyCalendarTwo {
    private typealias Period = (start:Int,end:Int)
    private var calendar = Array<Period>()
    private var overlap = Array<Period>()
    init() {
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        for (s,e) in overlap {
            if start < e && end > s {
                return false
            }
        }
        for (s,e) in calendar {
            if start < e && end > s {
                overlap.append((max(start, s),min(end, e)))
            }
        }
        calendar.append((start,end))
        return true
    }
}

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * let obj = MyCalendarTwo()
 * let ret_1: Bool = obj.book(start, end)
 */