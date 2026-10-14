//https://leetcode.cn/problems/number-of-intersecting-interval-pairs-ii/
class Solution {
    private typealias Interval = (left:Int, right:Int)
    private let INF = 1_000_000_007
    func countIntersectingIntervals(_ intervals: [[Int]]) -> Int {
        let M = intervals.count
        let intervalsCopy:[Interval] = intervals.map {($0[0],$0[1])}
        let sortedByStart = [(-1,-1)] + intervalsCopy.sorted { p1, p2 in
            p1.left < p2.left
        } + [(INF,INF)]
        let sortedByEnd = [(-1,-1)] + intervalsCopy.sorted { p1, p2 in
            p1.right < p2.right
        } + [(INF,INF)]
        let N = M + 2
        func binarySearchFirstIdx(largeThan target: Int) -> Int {
            var l = 0
            var r = N - 1
            while l < r {
                let mid = (l + r) >> 1
                if sortedByStart[mid].left <= target {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l
        }

        func binarySearchLast(smallerThan  target: Int) -> Int {
            var l = 0
            var r = N - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if sortedByEnd[mid].right >= target {
                    r = mid - 1
                } else {
                    l = mid
                }
            }
            return l
        }

        var doubleInterCnt = 0

        for (l,r) in intervalsCopy {
            //left > r
            let i = binarySearchFirstIdx(largeThan: r)
           doubleInterCnt +=  N - 1 - i
            //right < l
            let j = binarySearchLast(smallerThan: l)
            doubleInterCnt += j
        }
        return M * ( M - 1) / 2 - doubleInterCnt / 2
    }
}
