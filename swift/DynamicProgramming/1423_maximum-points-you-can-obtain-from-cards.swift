// https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/
class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        guard !cardPoints.isEmpty else {
            return 0
        }
        var preffix = cardPoints
        var suffix = cardPoints
        if cardPoints.count > 1 {
            for i in 1..<cardPoints.count {
                preffix[i] += preffix[i - 1]
            }
            for i in stride(from: cardPoints.count - 2, through: 0, by: -1) {
                suffix[i] += suffix[i + 1]
            }
        }
        guard k != cardPoints.count else {
            return preffix.last!
        }
        suffix = suffix.reversed()
        var ans = 0
        for left in 0...k {
            ans = max(ans, (left > 0 ? preffix[left - 1] : 0) + (left != k ? suffix[k - left - 1] : 0))
        }
        return ans
    }
}

