// https://leetcode.com/problems/make-two-arrays-equal-by-reversing-sub-arrays/
class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        var ans = 0
        target.forEach {ans = ans ^ $0}
        arr.forEach {ans = ans ^ $0}
        return ans == 0
    }
}