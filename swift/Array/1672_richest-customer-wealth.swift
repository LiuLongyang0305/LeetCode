// https://leetcode.com/problems/richest-customer-wealth/
class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var ans = 0
        for account in accounts {
            ans = max(ans, account.reduce(0, {$0 + $1}))
        }
        return ans
    }
}