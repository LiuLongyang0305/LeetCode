 // https://leetcode.com/problems/count-operations-to-obtain-zero/
class Solution {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        guard num1 != 0 && num2 != 0 else {
            return 0
        }
        if num1 >= num2 {
            return 1 + countOperations(num1 - num2, num2)
        } else {
            return 1 + countOperations(num1, num2 - num1)
        }
    }
}