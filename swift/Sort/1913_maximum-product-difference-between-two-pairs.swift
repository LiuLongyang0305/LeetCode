// https://leetcode.com/problems/maximum-product-difference-between-two-pairs/
class Solution {
    func maxProductDifference(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        let N = nums.count
        return sortedNums[N - 1] * sortedNums[N - 2] - sortedNums[0] * sortedNums[1]
    }
}

