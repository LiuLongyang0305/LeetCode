    // https://leetcode.cn/problems/minimize-connected-groups-by-inserting-interval/
    class Solution {

        private typealias Interval = (start:Int,end:Int)
        func minConnectedGroups(_ intervals: [[Int]], _ k: Int) -> Int {
            let sortedIntervals:[Interval] = intervals.map {($0[0],$0[1])}.sorted { p1, p2 in
                p1.start < p2.start
            }

            var merge = [Interval]()
            var (curStart,curEnd) = (sortedIntervals[0].start,sortedIntervals[0].end)
            for (newStart,newEnd) in sortedIntervals {
                if newStart <= curEnd {
                    curEnd = max(curEnd,newEnd)
                } else {
                    merge.append((curStart,curEnd))
                    (curStart,curEnd) = (newStart,newEnd)
                }
            }
            merge.append((curStart,curEnd))
            var ans = merge.count
            var n = merge.count
            var right = 0
            for left in 0..<n {
                while right < n && merge[right].start <= merge[left].end + k {
                    right += 1
                }
                ans = min(ans, n - (right - left  - 1))
            }
            return ans
        }
    }
