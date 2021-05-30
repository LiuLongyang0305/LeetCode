// https://leetcode.com/problems/minimize-maximum-pair-sum-in-array/
class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        let sortedNumbers = nums.sorted()
        var ans = Int.min
        let N = sortedNumbers.count
        for idx in 0..<(N >> 1) {
            ans = max(ans, sortedNumbers[idx] + sortedNumbers[N - 1 - idx])
        }
        return ans
    }
}

