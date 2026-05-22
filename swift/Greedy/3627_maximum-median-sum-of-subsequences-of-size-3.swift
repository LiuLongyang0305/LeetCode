//https://leetcode.com/problems/maximum-median-sum-of-subsequences-of-size-3/
class Solution {
    func maximumMedianSum(_ nums: [Int]) -> Int {
        let  sortedNums = nums.sorted()
        let M = nums.count / 3
        let N = sortedNums.count
        var sb = 0
        for i in stride(from: M, to: N, by: 2) {
            sb += sortedNums[i]
        }
        return sb
    }
}
