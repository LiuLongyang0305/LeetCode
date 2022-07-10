 // https://leetcode.com/problems/minimum-amount-of-time-to-fill-cups/
class Solution {
    func fillCups(_ amount: [Int]) -> Int {
        let sortedAmount = amount.sorted()
        if sortedAmount[2] >= sortedAmount[1] + sortedAmount[0] {
            return sortedAmount[2]
        }
        var ans = Int.max
        for i in 1...sortedAmount[0] {
            for j in 1...sortedAmount[1] {
                if i + j == sortedAmount[2] {
                    ans = min(ans, sortedAmount[2] + max(sortedAmount[0] - i,sortedAmount[1] - j))
                }
            }
        }
        return ans
    }
}