// https://leetcode.com/problems/count-number-of-special-subsequences/
class Solution {
    private let MOD = 1_000_000_007
    typealias Counter = (zero:Int,one:Int,two:Int)
    func countSpecialSubsequences(_ nums: [Int]) -> Int {
        var counter: Counter = (0,0,0)
        for num in nums {
            var newCounter = counter
            if num == 0 {
                newCounter.zero = (counter.zero * 2 + 1) % MOD
            } else if num == 1 {
                newCounter.one = (counter.one * 2 + newCounter.zero) % MOD
            } else {
                newCounter.two = (counter.one + counter.two * 2) % MOD
            }
            counter = newCounter
        }
        return counter.two
    }
}