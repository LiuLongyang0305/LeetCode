// https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof/
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
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        func dfs(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
            if  nil == b {
                return true
            }
            if nil == a {
                return false
            }
            return a!.val == b!.val && dfs(a?.left, b?.left) && dfs(a?.right, b?.right)
        }
        guard let t2 = B , let t1 = A else {
            return false
        }
        var ans = false
        func dfs1(_ node: TreeNode?)  {
            guard let n = node else {
                return
            }
            if n.val == t2.val {
                ans = dfs(n, t2)
            }
            guard !ans else {
                return
            }
            dfs1(n.left)
            dfs1(n.right)
        }
        dfs1(t1)
        return ans
    }
}