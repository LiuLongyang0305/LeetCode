// https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/
class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        return ((high % 2  == 0 ? high : (high + 1)) - (low % 2 == 0 ? low : (low - 1))) >> 1
    }
}