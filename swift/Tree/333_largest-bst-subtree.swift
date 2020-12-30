// https://leetcode.com/problems/largest-bst-subtree/
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
    private var ans = 0
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        inorder(root)
        return ans
    }
    
    private func inorder(_ root: TreeNode?) -> (values:[Int],isBST:Bool)  {
        guard let r = root else {
            return ([],true)
        }
        let left = inorder(r.left)
        let right = inorder(r.right)
        if left.isBST && right.isBST && r.val > (left.values.last ?? Int.min) && r.val <= (right.values.first ?? Int.max) {
            ans = max(ans, left.values.count + right.values.count + 1)
            return (left.values + [r.val] + right.values, true)
        }
        return ([],false)
    }
}
