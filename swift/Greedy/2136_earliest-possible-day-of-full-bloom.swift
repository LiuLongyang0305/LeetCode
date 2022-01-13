// https://leetcode.com/problems/earliest-possible-day-of-full-bloom/
class Solution {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        let N = growTime.count
        let sortedIdx = (0..<N).sorted { growTime[$0] > growTime[$1]}
        var ans = 0
        var cur = 0
        for idx in sortedIdx {
            cur += plantTime[idx]
            ans = max(ans, cur + growTime[idx])
        }
        return ans
    }
}