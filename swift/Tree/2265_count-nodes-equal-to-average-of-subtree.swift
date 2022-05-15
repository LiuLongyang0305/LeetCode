 // https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree/
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
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var cnt = 0


        func dfs(_ node: TreeNode?) -> (sum:Int,cnt:Int) {
            guard let n = node else {return(0,0)}
            let (ls,lc) = dfs(n.left)
            let (rs,rc) = dfs(n.right)
            let (ts,tc) = (n.val + ls + rs,1 + lc + rc )
            if  n.val == ts / tc {
                cnt += 1
            }
            return (ts,tc)
        }


        let _ = dfs(root)

        return cnt
    }
}