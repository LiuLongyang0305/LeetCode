// https://leetcode.com/problems/closest-dessert-cost/
class Solution {
    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        var ans = baseCosts[0]
        let M = toppingCosts.count
        func getCosts(of choice: Int) -> Int {
            var cost = 0
            for l in 0..<M {
                if choice & (1 << l) != 0 {
                    cost += toppingCosts[l]
                }
            }
            return cost
        }
        let numToCosts = (0..<(1 << M)).map {getCosts(of: $0)}
        
        for baseCost in baseCosts {
            for first in 0..<(1 << M) {
                for second in 0..<(1 << M) {
                    let curCost = baseCost + numToCosts[first] + numToCosts[second]
                    switch abs(ans - target) - abs(curCost - target) {
                    case 0:
                        ans = min(ans, curCost)
                        break
                    case 0...:
                        ans = curCost
                        break
                    default:
                        break
                    }
                    
                }
            }
        }
        return ans
    }
}



