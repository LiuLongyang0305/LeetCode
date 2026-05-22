
    //https://leetcode.cn/problems/absolute-difference-between-maximum-and-minimum-k-elements/
    class Solution {
        func absDifference(_ nums: [Int], _ k: Int) -> Int {
            let sortedNums = nums.sorted()
            let M = sortedNums.count
            let maxKElesSum = sortedNums.dropFirst(M - k).reduce(0) { $0 + $1}
            let minKElesSum = sortedNums.dropLast(M - k).reduce(0) { $0 + $1}
            return maxKElesSum - minKElesSum
        }
    }
