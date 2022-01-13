// https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together-ii/
class Solution {
    func minSwaps(_ nums: [Int]) -> Int {
        let cnt = nums.reduce(0) {$0 + $1}
        var preffix = [0]
        nums.forEach { preffix.append(preffix.last! + $0)}
        nums.forEach { preffix.append(preffix.last! + $0)}
        var ans = Int.max
        for startIdx in 1...nums.count {
            ans = min(ans, cnt - (preffix[startIdx + cnt - 1] - preffix[startIdx - 1]))
        }
        return ans
    }
}
