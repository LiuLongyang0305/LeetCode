// https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/
class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        var cnt = Array<Int>(repeating: 0, count: 1001)
        nums.forEach {cnt[$0] += 1}
        var curCnt = 0
        for i in stride(from: 1000, through: 0, by: -1) {
            curCnt += cnt[i]
            if curCnt == i {
                return i
            }
        }
        return -1
    }
}