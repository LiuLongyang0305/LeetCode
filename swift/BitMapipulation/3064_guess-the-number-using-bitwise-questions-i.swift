// https://leetcode.cn/problems/guess-the-number-using-bitwise-questions-i/
/** 
 * Definition of commonSetBits API (defined in the parent class Problem)
 * func commonSetBits(_ num: Int) -> Int 
 */

class Solution : Problem {
    func findNumber() -> Int {
        var n = 0
        for i in 0..<30 {
            if commonSetBits(1 << i) > 0 {
                n = n | (1 << i)
            }
        }
        return n
    }
}
