// https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous/
class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        let N = nums.count
        let sortedNums = Set<Int>(nums).sorted()
        let M = sortedNums.count
        var ans = N
        var rightIdx = 0
        for leftIdx in 0..<M {
            let rightNum = sortedNums[leftIdx] + N - 1
            while rightIdx < M && sortedNums[rightIdx] <= rightNum {
                rightIdx += 1
            }
            ans = min(ans, N - (rightIdx - leftIdx))
        }
        return ans
    }
}