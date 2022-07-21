// https://leetcode.com/problems/maximum-number-of-pairs-in-array/
class Solution {
    func numberOfPairs(_ nums: [Int]) -> [Int] {
        var cnt = 0
        var counetr = [Int](repeating: 0, count: 101)
        nums.forEach { counetr[$0] += 1}
        for v in counetr {
            cnt += (v >> 1)
        }
        return[cnt, nums.count - 2 * cnt]
    }
}