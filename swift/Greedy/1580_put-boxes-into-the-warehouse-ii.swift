// https://leetcode.com/problems/put-boxes-into-the-warehouse-ii/
class Solution {
    func maxBoxesInWarehouse(_ boxes: [Int], _ warehouse: [Int]) -> Int {
        let N = warehouse.count
        var leftMaxhight = Array<Int>(repeating: 0, count: N)
        var cur = Int.max
        for i in 0..<N {
            cur = min(cur, warehouse[i])
            leftMaxhight[i] = cur
        }
        var maxHeight = Array<Int>(repeating: 0, count: N)
        cur = Int.max
        for i in stride(from: N - 1, through: 0, by: -1) {
            cur = min(cur, warehouse[i])
            maxHeight[i] = max(cur, leftMaxhight[i])
        }
        maxHeight.sort()
        var ans = 0
        let sortedBox = boxes.sorted()
        var p = 0
        var q = 0
        while p < sortedBox.count && q < N {
            if sortedBox[p] <= maxHeight[q] {
                ans += 1
                p += 1
                q += 1
            } else {
                q += 1
            }
        }
        return ans
    }
}