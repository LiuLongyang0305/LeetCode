//https://leetcode.com/problems/count-number-of-trapezoids-i/
class Solution {
    private let MOD = 1_000_000_007
    func countTrapezoids(_ points: [[Int]]) -> Int {
        var sb = 0
        var counter = [Int:Int]()
        for p in points {
            counter[p[1],default: 0] += 1
        }
        let N = points.count
        let sortedCounter = counter.sorted { p1, p2 in
            p1.key < p2.key
        }
        var s = 0
        for (_,cnt) in sortedCounter {
           let k = (cnt - 1) * cnt / 2
            sb += s * k
            sb %= MOD
            s += k
        }
        return sb
    }
}

