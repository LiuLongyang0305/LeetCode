// https://leetcode.com/problems/maximum-prime-difference/
class Solution {
    private let primersSet: Set<Int> = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    func maximumPrimeDifference(_ nums: [Int]) -> Int {
        if let f = nums.firstIndex(where: { primersSet.contains($0)}), let l = nums.lastIndex(where: { primersSet.contains($0)}) {
            return l - f
        }
        return -1
    }
}
