// https://leetcode.com/problems/put-boxes-into-the-warehouse-i/
class Solution {
    func maxBoxesInWarehouse(_ boxes: [Int], _ warehouse: [Int]) -> Int {
        guard warehouse.count > 1 else {
            return boxes.min()! <= warehouse[0] ? 1 : 0
        }
        let sortedBoxes = boxes.sorted()
        var preffixMinEle = warehouse
        let N = warehouse.count
        for idx in 1..<N {
            if preffixMinEle[idx] > preffixMinEle[idx - 1] {
                preffixMinEle[idx] = preffixMinEle[idx - 1]
            }
        }
        var cnt = 0
        var i = N - 1
        var j = 0
        while i >= 0 && j < boxes.count {
            if sortedBoxes[j] <= preffixMinEle[i] {
                cnt += 1
                j += 1
            }
            i -= 1
        }
        return cnt
    }
}