// https://leetcode.com/problems/divide-array-into-equal-pairs/
class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        var cnt = [Int](repeating: 0, count: 501)
        nums.forEach { cnt[$0] += 1}
        for v in cnt {
            guard v & 1 == 0 else {return false}
        }
        return true
    }
}