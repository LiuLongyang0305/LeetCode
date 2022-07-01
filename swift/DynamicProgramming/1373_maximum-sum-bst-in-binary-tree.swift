// https://leetcode.com/problems/maximum-sum-bst-in-binary-tree/
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
    private typealias Info = (isBST:Bool,sum: Int,minEle:Int,maxEle: Int)
    func maxSumBST(_ root: TreeNode?) -> Int {
        var ans = 0


        func dfs(_ node: TreeNode?) -> Info? {
            guard let n = node else {return nil}
            //leaf
            if nil == n.left && nil == n.right {
                ans = max(ans, n.val)
                return (true,n.val,n.val,n.val)
            } else {
                //other nodes
                var info:Info = (false,-1,-1,-1)
                let leftAns = dfs(n.left)
                let rightAns = dfs(n.right)
                info.isBST = (leftAns?.isBST ?? true) && (rightAns?.isBST ?? true) && (leftAns?.maxEle ?? Int.min < n.val) && (rightAns?.minEle ?? Int.max > n.val)
                info.sum = (leftAns?.sum ?? 0) + (rightAns?.sum ?? 0) + n.val

                info.minEle = leftAns?.minEle ?? n.val
                info.maxEle = rightAns?.maxEle ?? n.val
                if info.isBST {
                    ans = max(ans, info.sum)
                }
                return info
            }
        }
        let _ = dfs(root)
        return ans
    }
}