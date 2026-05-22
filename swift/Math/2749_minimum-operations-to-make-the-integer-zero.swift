// https://leetcode.com/problems/minimum-operations-to-make-the-integer-zero/
class Solution {
    func makeTheIntegerZero(_ num1: Int, _ num2: Int) -> Int {
        var  k = 1
        while num1 - k * num2 >= k {
            if k >= (num1 - k * num2).nonzeroBitCount {
                return k
            }
            k += 1
        }
        return -1
    }
}
