// https://leetcode.com/problems/calculate-amount-paid-in-taxes/
class Solution {
    func calculateTax(_ brackets: [[Int]], _ income: Int) -> Double {
        let M = brackets.count
        var ans = 0
        var last = 0
        var i = 0
        while i < M {
            guard income > brackets[i][0] else {break}
            ans += (brackets[i][0] - last) * brackets[i][1]
            last = brackets[i][0]
            i += 1
        }
        ans += (income - last) * brackets[i][1]
        return Double(ans) / 100.0
    }
}