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


class Solution {
    private typealias Squre = (min:Int,max:Int,isBST:Bool,nodeCnt:Int)
    func largestBSTSubtree(_ root: TreeNode?) -> Int {

        var ans = 0

        func dfs(_ node: TreeNode?) -> Squre? {
            guard let node = node else {
                return nil
            }

            var res: Squre = (0,0,false,0)
            let leftAns = dfs(node.left)
            let rightAns = dfs(node.right)
            //叶子节点
            if nil == leftAns && nil == rightAns {
                res =  (node.val,node.val,true,1)
            }

            //仅有右子树
            if nil == leftAns {
                if let r = rightAns {
                    res = (min(node.val, r.min),max(node.val, r.max),r.min > node.val && r.isBST,r.nodeCnt + 1)
                }
            }
            if nil == rightAns {
                if let l = leftAns {
                    res = (min(node.val, l.min),max(node.val, l.max),l.isBST && l.max < node.val,l.nodeCnt + 1)
                }
            }
            if let l = leftAns, let r = rightAns {
                res = (min(l.min, r.min,node.val),max(l.max, node.val,r.max),l.isBST && r.isBST && l.max < node.val && r.min > node.val,l.nodeCnt + r.nodeCnt + 1)
            }
            if res.isBST {
                ans = max(ans, res.nodeCnt)
            }
            return res
        }

        dfs(root)
        return ans
    }
}
