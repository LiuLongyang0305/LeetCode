//https://leetcode.com/problems/neighboring-bitwise-xor/
class Solution {
    func doesValidArrayExist(_ derived: [Int]) -> Bool {
        return derived.reduce(0) { $0 ^ $1} == 0
    }
}
