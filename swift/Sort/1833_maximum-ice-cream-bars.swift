// https://leetcode.com/problems/maximum-ice-cream-bars/
class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let sortedCost = costs.sorted()
        var cnt = 0
        var remain = coins
        for cost in sortedCost {
            guard remain >= cost  else {
                break
            }
            remain -= cost
            cnt += 1
        }
        return cnt
    }
}