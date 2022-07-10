// https://leetcode.com/problems/evaluate-boolean-binary-tree/
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
    func evaluateTree(_ root: TreeNode?) -> Bool {

        func  dfs(_ node: TreeNode?) -> Bool {
            guard let n = node else {
                return false
            }
            if nil == n.left && nil == n.right {
                return n.val == 1
            }
            let l = dfs(n.left)
            let r = dfs(n.right)
            if n.val == 2 {
                return l || r
            } else {
                return l && r
            }
        }
        return dfs(root)
    }
}