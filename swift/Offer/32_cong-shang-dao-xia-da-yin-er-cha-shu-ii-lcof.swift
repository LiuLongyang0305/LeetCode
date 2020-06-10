// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        func dfs(_ node: TreeNode?, _ depth: Int) {
            guard let node = node else {
                return
            }
            if ans.count < depth + 1 {
                ans.append([])
            }
            ans[depth].append(node.val)
            dfs(node.left, 1 + depth)
            dfs(node.right, 1 + depth)
        }
        dfs(root,0)
        return ans
    }
}