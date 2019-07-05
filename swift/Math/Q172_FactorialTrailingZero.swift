//https://leetcode.com/problems/factorial-trailing-zeroes/class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        if n < 5 {
            return 0
        } else {
            return n / 5 + trailingZeroes(n / 5)
        }
    }
}