//https://leetcode.cn/problems/maximum-alternating-sum-of-squares/
    class Solution {
        func maxAlternatingSum(_ nums: [Int]) -> Int {
            let soteredSquares = nums.map { $0 * $0}.sorted { $0 > $1}
            let N = nums.count

            return soteredSquares.reduce(0) {$0 + $1} - 2 * soteredSquares.dropFirst(N - N / 2).reduce(0, { $0 + $1})
        }
    }
