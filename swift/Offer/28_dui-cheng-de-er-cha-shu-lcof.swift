// https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof/
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func helper(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
            if nil == l && nil == r {
                return true
            }
            if nil == l || nil == r || l!.val != r!.val {
                return false
            }
            return helper(l?.left, r?.right) && helper(l?.right, r?.left)
        }
        return nil == root ? true : helper(root?.left, root?.right)
    }
}