// https://leetcode.com/problems/minimum-difference-between-largest-and-smallest-value-in-three-moves/
class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        guard nums.count > 4 else {
            return 0
        }
        let sortedNumbers = nums.sorted()
        let N = nums.count
        var ans = Int.max
        for i in 0...3 {
            ans = min(ans, sortedNumbers[N - 4 + i] - sortedNumbers[i])
        }
        return ans
    }
}