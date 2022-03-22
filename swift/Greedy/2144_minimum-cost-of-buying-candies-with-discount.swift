//https://leetcode.com/problems/minimum-cost-of-buying-candies-with-discount/
class Solution {
    func minimumCost(_ cost: [Int]) -> Int {
        let sortedCost = cost.sorted { $0 > $1}
        var ans = 0
        let N = sortedCost.count
        var i = 0
        while i < N {
            ans += sortedCost[i]
            if i + 1 < N {
                ans += sortedCost[i + 1]
            }
            i += 3
        }
        return ans
    }
}