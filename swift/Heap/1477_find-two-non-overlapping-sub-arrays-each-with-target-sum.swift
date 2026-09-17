class Solution {
//    typealias Pair = (left:Int, right:Int)
    private let INF = 1_000_000_007
    struct Pair: Comparable {
        var left: Int
        var right: Int
        func getLen() -> Int {
            return right - left
        }
        static func < (lhs: Solution.Pair, rhs: Solution.Pair) -> Bool {
            if lhs.getLen() == rhs.getLen() {
                return lhs.left < rhs.left
            }
            return lhs.getLen() < rhs.getLen()
        }

    }
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        var preSum  = [Int](repeating: 0, count: 1 + arr.count)

        for (i,v) in arr.enumerated() {
            preSum[i + 1] = preSum[i] + v
        }
        var preSumToLastIdx = [Int:Int]()
        var indicePairs = [Pair]()

        for (i,v) in preSum.enumerated() {
            preSumToLastIdx[v] = i
            if let idx = preSumToLastIdx[v - target] {
                indicePairs.append(Pair(left: idx, right: i))
            }
        }
        let sortedIndicePairs = indicePairs.sorted { p1, p2 in
            p1.left < p2.left
        }
        var heap = Heap<Pair>(sortedIndicePairs)
        var sb = INF
        //枚举第一个子数组
        for p in sortedIndicePairs {
            while let top = heap.min, top.left < p.right {
                let _ = heap.popMin()
            }
            if let top = heap.min {
                sb = min(sb,p.getLen() + top.getLen())
            }
        }
        return sb == INF ? -1 : sb
    }
}
