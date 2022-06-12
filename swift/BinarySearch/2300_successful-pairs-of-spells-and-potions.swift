// https://leetcode.com/problems/successful-pairs-of-spells-and-potions/
class Solution {
    private let INF = 10000000005
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let sortedPotions = [0] + potions.sorted() + [INF]
        let M = sortedPotions.count
        func binarySearch(_ taregt: Int) -> Int {
            var left = 0
            var right = M - 1
            while left < right {
                let mid = (left + right) >> 1
                if sortedPotions[mid] * taregt >= success {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }



        return spells.map { M - 1 - binarySearch($0)}
    }
}