//https://leetcode.com/problems/reveal-cards-in-increasing-order/
class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var index = Array<Int>(0..<deck.count)
        var ans = Array<Int>(repeating: 0, count: deck.count)
        let sortedDeck = deck.sorted()
        for card in sortedDeck {
            ans[index.removeFirst()] = card;
            if(!index.isEmpty) {
                index.append(index.removeFirst())
            }
        }
        return ans
    }
}