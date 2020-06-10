// https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        func depth(_ root : TreeNode?) -> Int {
            if nil == root {
                return 0
            } else {
                return 1 + max(depth(root?.left), depth(root?.right))
            }
        }
        if nil == root {
            return true
        } else {
            let leftDepth = depth(root?.left)
            let rightDepth = depth(root?.right)
            let delta = leftDepth > rightDepth ? (leftDepth - rightDepth ) : (rightDepth - leftDepth)
            return  delta <= 1 && isBalanced(root?.left) &&  isBalanced(root?.right)
        }
    }
}