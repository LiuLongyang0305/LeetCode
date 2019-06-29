//https://leetcode.com/problems/fibonacci-number/
class Solution {
    func fib(_ N: Int) -> Int {
        if N < 2 {
            return N
        }
        var f0 = 0
        var f1 = 1
        for _ in 2...N {
            (f0,f1) = (f1, f0 + f1)
        }
        return f1
    }
}