// https://leetcode.com/problems/smallest-even-multiple/
class Solution {
    func smallestEvenMultiple(_ n: Int) -> Int {
        return n & 1 == 0 ? n : (n << 1)
    }
}