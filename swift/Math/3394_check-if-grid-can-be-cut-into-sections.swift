//https://leetcode.cn/problems/check-if-grid-can-be-cut-into-sections/
class Solution {
    private typealias Pair = (from: Int,  to: Int)
    func checkValidCuts(_ n: Int, _ rectangles: [[Int]]) -> Bool {
        var xPairs = [Pair]()
        var yPairs = [Pair]()

        for r in rectangles {
            xPairs.append((r[0],r[2]))
            yPairs.append((r[1],r[3]))
        }
        return check(xPairs) || check(yPairs)
    }

    private func check(_ pairs: [Pair]) -> Bool {

        let sortedPairs = pairs.sorted { p1, p2 in
            if p1.from == p2.from {
                return p1.to > p2.to
            }
            return p1.from < p2.from
        }

        var cnt = 1
        var lastPair : Pair = sortedPairs[0]

        for pair in sortedPairs.dropFirst() {
            if pair.from >= lastPair.from && pair.from < lastPair.to {
                lastPair.to = max(pair.to,lastPair.to)
            } else {
                cnt += 1
                lastPair = pair
            }
            if cnt >= 3 {
                return true
            }
        }
        return false
    }
}
