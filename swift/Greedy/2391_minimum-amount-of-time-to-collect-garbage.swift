//https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage/
class Solution {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        let N = garbage.count
        let collectGarbageCost = garbage.reduce(0) { $0 + $1.count}
        var detinations = [Int:Int]()
        if let idx = garbage.lastIndex(where: { $0.contains("M")}) {
            detinations[idx,default: 0] += 1
        }
        if let idx = garbage.lastIndex(where: { $0.contains("P")}) {
            detinations[idx,default: 0] += 1
        }
        if let idx = garbage.lastIndex(where: { $0.contains("G")}) {
            detinations[idx,default: 0] += 1
        }
        var travelCost = 0
        var curCostFromStart = 0
        for i in 0..<(N - 1) {
            curCostFromStart += travel[i]
            if let c = detinations[i + 1] {
                travelCost += c * curCostFromStart
            }
        }
        return collectGarbageCost + travelCost
    }
}