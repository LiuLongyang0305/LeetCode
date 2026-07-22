//https://leetcode.cn/problems/number-of-elapsed-seconds-between-two-times/
class Solution {
    func secondsBetweenTimes(_ startTime: String, _ endTime: String) -> Int {
        return getSecondsFromZero(timestr: endTime) - getSecondsFromZero(timestr: startTime)
    }
    private func getSecondsFromZero(timestr: String) -> Int {
        let nums = timestr.components(separatedBy: ":").map {Int($0) ?? 0}
        return 60 * 60 * nums[0] + 60 * nums[1] + nums[2]
    }
}
