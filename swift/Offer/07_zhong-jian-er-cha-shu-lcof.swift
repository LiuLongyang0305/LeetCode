// https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty {
            return nil
        }
        let rootValue = preorder[0]
        let root : TreeNode? = TreeNode(rootValue)
        if preorder.count != 1 {
            let index = inorder.firstIndex(of: rootValue)!
            let arrs = inorder.split(separator: rootValue)
            
            if 1 == arrs.count {
                let currentPreorder = preorder.suffix(from: 1)
                if index == 0 {
                    //no left tree
                    root?.right = buildTree(Array<Int>(currentPreorder), Array<Int>(arrs[0]))
                } else  {
                    //no right tree
                    root?.left = buildTree(Array<Int>(currentPreorder), Array<Int>(arrs[0]))
                }
            } else {
                let rightPreorder = preorder.suffix(from: index + 1)
                let leftPreorder = preorder[1...(index)]
                root?.left = buildTree(Array<Int>(leftPreorder), Array<Int>(arrs[0]))
                root?.right = buildTree(Array<Int>(rightPreorder), Array<Int>(arrs[1]))
            }
        }
        return root
    }
}