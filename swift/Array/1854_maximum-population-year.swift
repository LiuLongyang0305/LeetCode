// https://leetcode.com/problems/maximum-population-year/
class Solution {
    func maximumPopulation(_ logs: [[Int]]) -> Int {
        var lifePeriods = Array<Int>(repeating: 0, count: 105)
        for log in logs {
            lifePeriods[log[0] - 1950] += 1
            lifePeriods[log[1] - 1950] -= 1
        }
        var total = 0
        var ans: (year:Int,num: Int) = (-1,-1)
        for year in 1950...2050 {
            total += lifePeriods[year - 1950]
            if total > ans.num {
                ans.year = year
                ans.num = total
            }
        }
        return ans.year
    }
}