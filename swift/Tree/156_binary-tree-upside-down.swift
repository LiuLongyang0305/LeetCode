// https://leetcode.com/problems/binary-tree-upside-down/
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
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        guard let r = root else {
            return root
        }
        guard let left = r.left else {
            return root
        }
        let right = r.right
        r.left = nil
        r.right = nil
        let ans = upsideDownBinaryTree(left)
        left.left = right
        left.right = root
        return ans
    }
}
