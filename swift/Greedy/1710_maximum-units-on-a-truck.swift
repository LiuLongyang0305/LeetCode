// https://leetcode.com/problems/maximum-units-on-a-truck/
class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        var ans = 0
        let sortedBoxTypes = boxTypes.sorted { (type1, type2) -> Bool in
            type1[1] > type2[1]
        }
        var remainTruckSize = truckSize
        let N = boxTypes.count
        var boxTypeIdx = 0
        while boxTypeIdx < N && remainTruckSize > 0 {
            let size = min(remainTruckSize, sortedBoxTypes[boxTypeIdx][0])
            ans += size * sortedBoxTypes[boxTypeIdx][1]
            remainTruckSize -= size
            boxTypeIdx += 1
        }
        return ans
    }
}