 // https://leetcode.com/problems/largest-positive-integer-that-exists-with-its-negative/
class Solution {
    func findMaxK(_ nums: [Int]) -> Int {
        let set = Set<Int>(nums)
        for i in stride(from: 1000, through: 1, by: -1) {
            if set.contains(i) && set.contains(-i) {
                return i
            }
        }
        return -1
    }
}