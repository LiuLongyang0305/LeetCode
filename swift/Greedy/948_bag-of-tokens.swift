// https://leetcode.com/problems/bag-of-tokens/

class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
        
        var ans = 0
        var score = 0
        var power = P
        
        let sortedTokens = tokens.sorted()

        var left = 0
        var right = sortedTokens.count - 1
        while left <= right && (power >= sortedTokens[left] || score > 0) {
            while  left <= right && power >= sortedTokens[left] {
                power -= sortedTokens[left]
                score += 1
                left += 1
            }
            ans = max(ans, score)
            if left <= right && score > 0  {
                score -= 1
                power += sortedTokens[right]
                right -= 1
            }
        }
        return ans
    }
}

