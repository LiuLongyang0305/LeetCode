//https://leetcode.com/problems/distribute-candies/
typealias Counter = Dictionary<Int,Int>
class Solution {
    func distributeCandies(_ candies: [Int]) -> Int {
        var counter = Counter()
        let needCandies = candies.count / 2

        for candyType in candies {
            if  nil == counter[candyType] {
                counter[candyType] = 1
            } else {
                counter[candyType] = counter[candyType]! + 1
            }
            if counter.count >= needCandies {
                return needCandies
            }
        }
        return counter.count
    }
}
