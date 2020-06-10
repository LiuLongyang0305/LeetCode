// https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof/
class Solution {
    private let MOD = 1_000_000_007
    func fib(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        var first = 0
        var second = 1
        for _ in 2...n {
            (first,second) = (second,(first + second) % MOD )
        }
        return second
    }
}