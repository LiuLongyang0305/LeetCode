// https://leetcode.com/problems/minimum-lines-to-represent-a-line-chart/
class Solution {
    private typealias Point = (x:Int,y:Int)
    private typealias Vector = (x:Int,y:Int)
    func minimumLines(_ stockPrices: [[Int]]) -> Int {
        let N = stockPrices.count
        guard N > 2 else {
            return N < 2 ? 0 : 1
        }
        var cnt = 1
        let points:[Point] = stockPrices.map { ($0[0],$0[1])}.sorted { p1, p2 in
            p1.x < p2.x
        }
        var last: Vector = (points[0].x - points[1].x,points[0].y - points[1].y)


        for idx in 2..<N {
            let cur: Vector = (points[idx].x - points[idx - 1].x, points[idx].y - points[idx - 1].y)
            if last.y * cur.x != last.x * cur.y {
                cnt += 1
                last = cur
            }
        }
        return cnt
    }
}