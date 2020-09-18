// https://leetcode.com/problems/check-if-a-string-is-a-valid-sequence-from-root-to-leaves-path-in-a-binary-tree/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        guard let r = root, r.val == arr[0] else {
            return false
        }
        let nextArr = [Int](arr.dropFirst())
        guard !nextArr.isEmpty else {
            return nil == r.left && nil == r.right
        }
        return isValidSequence(r.left, nextArr) || isValidSequence(r.right, nextArr)
    }
}
