// https://leetcode.com/problems/verify-preorder-sequence-in-binary-search-tree
class Solution {
    func verifyPreorder(_ preorder: [Int]) -> Bool {
        var stack = [Int]()
        var currentMax = Int.min
        for val in preorder {
            while !stack.isEmpty && val > stack.last! {
                currentMax = stack.removeLast()
            }
            if val < currentMax {
                return false
            }
            stack.append(val)
        }
        return true
    }
}
