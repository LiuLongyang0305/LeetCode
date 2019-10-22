//https://leetcode.com/problems/koko-eating-bananas/
class Solution {
    func minEatingSpeed(_ piles: [Int], _ H: Int) -> Int {
        let piplesCopy = piles.map {$0 - 1}
        var left = 1
        var right = piles.max()!
        func valid(_ bananas: Int) -> Bool  {
            return  piplesCopy.map{$0 / bananas + 1}.reduce(0) {$0 + $1} <= H
        }
        func valid2(_ bananas: Int) ->  Bool {
            var hours = 0
            for piple in piplesCopy {
                hours += piple / bananas + 1
            }
            return hours <= H
        }
        while left < right {
            let mid = left + (right - left ) >>  1
            if valid2(mid) {
                right =  mid
            } else {
                left =  mid + 1
            }
        }
        return left
    }
}