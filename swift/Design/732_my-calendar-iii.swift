// https://leetcode-cn.com/problems/my-calendar-iii/
class MyCalendarThree {
    private typealias Event = (time:Int,val:Int)
    private var queue = [Event]()
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Int {
        insert((start,1))
        insert((end , -1))
        var cur = 0
        var ans = -1
        for (_,val) in queue {
            cur += val
            ans = max(ans, cur)
        }
        return ans
    }
    
    private func insert(_ event: Event) {
        guard !queue.isEmpty else {
            queue.append(event)
            return
        }
        guard event.time > queue[0].time else {
            if event.time == queue[0].time {
                queue[0].val += event.val
            } else {
                queue.insert(event, at: 0)
            }
            return
        }
        guard event.time < queue.last!.time else {
            if event.time == queue.last!.time {
                queue[queue.count - 1].val += event.val
            } else {
                queue.append(event)
            }
            return
        }
        var left = 0
        var rihght = queue.count - 1
        while left < rihght {
            let mid = (left + rihght) >> 1
            if event.time == queue[mid].time {
                queue[mid].val += event.val
                return 
            } else if event.time < queue[mid].time {
                rihght = mid
            } else {
                left = mid + 1
            }
        }
        if queue[left].time == event.time {
            queue[left].val += event.val
        } else {
            queue.insert(event, at: left)
        }
    }
}

/**
 * Your MyCalendarThree object will be instantiated and called as such:
 * let obj = MyCalendarThree()
 * let ret_1: Int = obj.book(start, end)
 */