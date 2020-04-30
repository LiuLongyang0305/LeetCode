// https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/
class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        let total = cardPoints.reduce(0) {$0 + $1}
        guard k < cardPoints.count else {
            return total
        }
        let remain = cardPoints.count - k
        
        var remainPoints = 0
        var ans = 0
        for i in 0..<cardPoints.count {
            if i < remain {
                remainPoints += cardPoints[i]
            } else {
                ans = max(ans, total - remainPoints)
                remainPoints -= cardPoints[i - remain]
                remainPoints += cardPoints[i]
            }
        }
        ans = max(ans, total - remainPoints)
        return ans
    }
}