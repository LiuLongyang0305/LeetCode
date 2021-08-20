// https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/
class Solution {
    private struct State: Hashable {
        var curPos: Int
        var need: Int
        var lastTime: Int
    }
    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        let sortedEvents = events.sorted { event1, event2 in
            if event1[0] != event2[0] {
                return event1[0] < event2[0]
            }
            if event1[2] != event2[2] {
                return event1[2] > event2[2]
            }
            return event1[1] < event2[1]
        }
        let M = sortedEvents.count
        var memo = [State:Int]()
        func helper(_ curPos: Int, _ lastTime: Int, _ need: Int) -> Int {
            guard curPos < M && need > 0 else {
                return 0
            }
            let key = State(curPos: curPos, need: need, lastTime: lastTime)
            guard nil == memo[key] else {
                return memo[key]!
            }
            var ans = helper(curPos + 1, lastTime, need)
            if sortedEvents[curPos][0] > lastTime {
                ans = max(ans, sortedEvents[curPos][2] + helper(curPos + 1, sortedEvents[curPos][1], need - 1))
            }
            memo[key] = ans
            return ans
        }
        return helper(0, 0, k)
    }
}