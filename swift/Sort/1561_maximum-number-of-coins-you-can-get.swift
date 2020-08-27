// https://leetcode.com/problems/maximum-number-of-coins-you-can-get/
class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        var ans = 0
        var  sortedPiles = piles.sorted()
        let N = piles.count
        sortedPiles.removeFirst(N / 3)
        var i = 0
        while i < sortedPiles.count {
            if i % 2 == 0 {
                ans += sortedPiles[i]
            }
            i += 1
        }
        return ans
    }
}

