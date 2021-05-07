 // https://leetcode.com/problems/maximum-element-after-decreasing-and-rearranging/
class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        guard arr.count > 1 else {
            return 1
        }
        let sortedArr = arr.sorted()
        var last = 1
        for idx in 1..<sortedArr.count {
            last = min(sortedArr[idx], last + 1)
        }
        return last
    }
}

