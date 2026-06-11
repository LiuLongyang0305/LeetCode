//https://leetcode.cn/problems/minimum-energy-to-maintain-brightness/
class Solution {
    private typealias Interval = (left: Int, right: Int)
    func minEnergy(_ n: Int, _ brightness: Int, _ intervals: [[Int]]) -> Int {
        let sortedRanges:[Interval] = intervals.map {($0[0],$0[1])}.sorted { i1, i2 in
            if i1.left == i2.left {
                return i1.right < i2.right
            }
            return i1.left < i2.left
        }

        var sumLen = 0
        var curInterval: Interval = sortedRanges[0]
        for (l,r) in sortedRanges.dropFirst() {
            if l > curInterval.right {
                sumLen += (curInterval.right - curInterval.left + 1)
                curInterval = (l,r)
            } else {
                curInterval.right = max(r,curInterval.right)
            }
        }

        // print(curInterval)
        sumLen += (curInterval.right - curInterval.left + 1)
        print(sumLen)
        return (brightness + 2) / 3 * sumLen
    }
}
