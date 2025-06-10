//https://leetcode.com/problems/maximize-ysum-by-picking-a-triplet-of-distinct-xvalues/
class Solution {
    func maxSumDistinctTriplet(_ x: [Int], _ y: [Int]) -> Int {
        var numToMaxY = [Int:Int]()
        let M = x.count
        for i in 0..<M{
            numToMaxY[x[i]] = max(numToMaxY[x[i]] ?? 0, y[i])
        }
        let sortedNumToMaxY = numToMaxY.sorted { $0.value > $1.value}
        // print(sortedNumToMaxY)
        guard sortedNumToMaxY.count >= 3 else {return -1 }
        return sortedNumToMaxY[0].value + sortedNumToMaxY[1].value + sortedNumToMaxY[2].value
    }
}
