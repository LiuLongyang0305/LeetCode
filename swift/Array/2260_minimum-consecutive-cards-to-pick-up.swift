// https://leetcode.com/problems/minimum-consecutive-cards-to-pick-up/
class Solution {
    func minimumCardPickup(_ cards: [Int]) -> Int {

        guard cards.count > 1 else {return -1}
        let maxVal = cards.max()!
        var lastIdx = [Int](repeating: -1, count: maxVal + 1)
        var ans = Int.max
        let M = cards.count
        for i in 0..<M {
            if lastIdx[cards[i]] != -1 {
                ans = min(ans, i - lastIdx[cards[i]] + 1)
            }
            lastIdx[cards[i]] = i
        }


        return ans == Int.max ? -1 : ans
    }
}