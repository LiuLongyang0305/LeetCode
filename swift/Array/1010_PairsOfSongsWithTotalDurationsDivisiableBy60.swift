//https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
class Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var remainder = Array<Int>(repeating: 0, count: 60)
        var pairCount = 0
        for ele in time {
            let currentTime = ele % 60
            pairCount += remainder[(60 - currentTime) % 60]
            remainder[currentTime] += 1
        }
        return pairCount
    }
}