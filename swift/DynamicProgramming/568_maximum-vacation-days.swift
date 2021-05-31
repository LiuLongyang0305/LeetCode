// https://leetcode.com/problems/maximum-vacation-days/
class Solution {
    private var flights = [[Int]]()
    private var days = [[Int]]()
    private var cityNumber = 0
    private var weeksNumber = 0
    private var memo = [Int:Int]()
    func maxVacationDays(_ flights: [[Int]], _ days: [[Int]]) -> Int {
        self.flights = flights
        self.days = days
        self.cityNumber = days.count
        self.weeksNumber = days[0].count
        self.memo = [:]
        return dfs(0, curWeek: 0)
    }
    private func dfs(_ curCity:Int, curWeek:Int) -> Int {
        guard curWeek < self.weeksNumber else {
            return 0
        }
        let key = curCity << 32 | curWeek
        guard nil == self.memo[key] else {
            return self.memo[key]!
        }
        var maxHolidays = 0
        var idx = 0
        while idx < self.cityNumber {
            if self.flights[curCity][idx] == 1 || curCity == idx {
                let curHolidays = self.days[idx][curWeek] + dfs(idx, curWeek: curWeek + 1)
                if curHolidays > maxHolidays {
                    maxHolidays = curHolidays
                }
            }
            idx += 1
        }
        self.memo[key] = maxHolidays
        return maxHolidays
    }
}
