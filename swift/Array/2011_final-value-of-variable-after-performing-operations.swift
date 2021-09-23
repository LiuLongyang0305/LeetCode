// https://leetcode.com/problems/final-value-of-variable-after-performing-operations/
class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        return operations.reduce(0) { $0 + (($1 == "++X" || $1 == "X++") ? 1 : -1 )}
    }
}