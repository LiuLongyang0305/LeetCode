// https://leetcode.cn/problems/find-maximal-uncovered-ranges/
class Solution {
    private typealias Pair = (l:Int,r:Int)
    func findMaximalUncoveredRanges(_ n: Int, _ ranges: [[Int]]) -> [[Int]] {
        guard !ranges.isEmpty else {return [[0, n - 1]]}
        var counter = [Int:Int]()
        for r in ranges {
            let (s,e) = (r[0],r[1])
            counter[s,default: 0] += 1
            counter[e + 1,default: 0] -= 1
        }
        let sortedCounter = counter.sorted { p1,p2  in
            p1.key < p2.key
        }
        var sum = 0
        var newCounter = [Int:Int]()
        for (k,v) in sortedCounter {
            sum += v
            newCounter[k] = sum
        }

        let sortedCounter2 = newCounter.sorted { p1, p2 in
            p1.key < p2.key
        }
        var maxLen  = Int.min
        var rans = [Pair]()
        if let f = sortedCounter2.first, f.key > 0 {
            maxLen = f.key
            rans.append((0,f.key - 1))
        }
        if let e = sortedCounter2.last, e.key <= n - 1 {
                rans.append((e.key, n - 1))
        }
        let M = sortedCounter2.count
        // print(sortedCounter2)
        for (idx,(k,v)) in sortedCounter2.enumerated() {
            if v == 0 && idx < M - 1 {
                let next = sortedCounter2[idx + 1]
                rans.append((k, next.key - 1))

            }
        }
        return rans.sorted { p1,p2 in
            return p1.l < p2.l
        }.map {[$0.l,$0.r]}
    }
}
