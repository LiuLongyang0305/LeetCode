// https://leetcode.cn/problems/count-dominant-nodes-in-a-binary-tree/
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
    func countDominantNodes(_ root: TreeNode?) -> Int {
        var sb = 0
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let n = node else {return -1}
            let maxValForSubtree = max(dfs(n.left),dfs(n.right))
            if maxValForSubtree <= n.val {
                sb += 1
            }
            return max(maxValForSubtree,n.val)
        }
        
        dfs(root)
        return sb
    }
}
