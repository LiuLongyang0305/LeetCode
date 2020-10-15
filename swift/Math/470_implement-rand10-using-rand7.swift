// https://leetcode.com/problems/implement-rand10-using-rand7/
/**
 * The rand7() API is already defined in the parent class SolBase.
 * func rand7() -> Int = {}
 * @return a random integer in the range 1 to 7
 */
class Solution : SolBase {
    func rand10() -> Int {
        var row = 0
        var col = 0
        var idx = 0
        repeat {
            row = rand7()
            col = rand7()
            idx = row + (col - 1) * 7
        } while idx > 40
        return 1 + (idx - 1) % 10
    }
}