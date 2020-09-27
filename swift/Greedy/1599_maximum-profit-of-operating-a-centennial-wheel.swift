// https://leetcode.com/problems/maximum-profit-of-operating-a-centennial-wheel/
class Solution {
    func minOperationsMaxProfit(_ customers: [Int], _ boardingCost: Int, _ runningCost: Int) -> Int {
        guard !customers.isEmpty else {
            return -1
        }
        guard boardingCost * 4 > runningCost else {
            return -1
        }
        let profits = [-runningCost,boardingCost - runningCost, 2 * boardingCost - runningCost, 3 * boardingCost - runningCost, 4 * boardingCost - runningCost]
        var maxProfit = Int.min
        var currentProfit = 0
        var rollsOnMaxProfit = -1
        var currentCustomers = 0
        var rolls = 0
        for num in customers {
            currentCustomers += num
            rolls += 1
            let boardCustomers = min(4, currentCustomers)
            currentProfit += profits[boardCustomers]
            currentCustomers -= boardCustomers
            if currentProfit > 0 && currentProfit > maxProfit{
                (maxProfit, rollsOnMaxProfit) = (currentProfit,rolls)
            }
        }
        
        let t = currentCustomers / 4
        currentCustomers = currentCustomers % 4
        
        if t > 0 {
            rolls += t
            currentProfit += t * profits[4]
            (maxProfit, rollsOnMaxProfit) = (currentProfit,rolls)
                
        }
        if currentCustomers > 0 {
            rolls += 1
            currentProfit += profits[currentCustomers ]
            if currentProfit > 0 && currentProfit > maxProfit  {
                (maxProfit, rollsOnMaxProfit) = (currentProfit,rolls)
            }
        }
        return rollsOnMaxProfit
    }
}


