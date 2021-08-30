// https://leetcode.com/problems/number-of-unique-good-subsequences/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}

class Solution {
    func numberOfUniqueGoodSubsequences(_ binary: String) -> Int {
        var endWithZero = 0
        var endWithOne = 0
        var hasZero = 0
        for ch in binary {
            if ch == "0" {
                hasZero = 1
                endWithZero = (endWithZero + endWithOne) % Int.mod
            } else {
                endWithOne = (endWithOne + endWithZero + 1) % Int.mod
            }
        }
        return (endWithOne + endWithZero + hasZero) % Int.mod
    }
}