// https://leetcode.com/problems/calculate-money-in-leetcode-bank/
class Solution {
    func totalMoney(_ n: Int) -> Int {
        let firstWeekMoney = (0...7).map { (0...$0).reduce(0) { $0 + $1}}
        guard n >= 7 else {
            return firstWeekMoney[n]
        }
        
        let totalWeek = n / 7
        let remainDays = n % 7
        var ans = totalWeek * firstWeekMoney[7] + 7 * (0..<totalWeek).reduce(0, { $0 + $1})
        ans += totalWeek * remainDays + firstWeekMoney[remainDays]
        return ans
    }
}