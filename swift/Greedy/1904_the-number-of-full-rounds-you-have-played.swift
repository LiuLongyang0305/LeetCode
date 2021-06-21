// https://leetcode.com/problems/the-number-of-full-rounds-you-have-played/
class Solution {
    func numberOfRounds(_ startTime: String, _ finishTime: String) -> Int {
        let st = getMinutesFromMiddleNight(to: startTime)
        var ft = getMinutesFromMiddleNight(to: finishTime)
        if ft < st {
            ft += 24 * 60
        }
        var ans = 0
        for time in st...ft {
            if time % 15 == 0 && ft - time >= 15 {
                ans += 1
            }
        }
        return ans
    }
    private func getMinutesFromMiddleNight(to time: String) -> Int {
        return Int(time.prefix(2))! * 60 + Int(time.suffix(2))!
    }
}