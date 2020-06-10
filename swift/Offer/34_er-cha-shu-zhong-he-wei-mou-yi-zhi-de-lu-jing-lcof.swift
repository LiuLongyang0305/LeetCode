// https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/
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
   func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var result = [[Int]]()
        var currentpath = [Int]()
        func dfs(_ root: TreeNode?,_ sum:  Int ) {
            if nil == root{
                return
            }
            let remaining = sum - (root?.val)!
            currentpath.append((root?.val)!)
            if nil == root?.left && nil == root?.right{
                if 0 == remaining {
                    result.append(currentpath)
                }
            }
            
            if nil != root?.left{
                dfs(root?.left, remaining)
            }
            
            if nil != root?.right {
                dfs(root?.right, remaining)
            }
            currentpath.removeLast()
        }
        dfs(root,sum)
        return result
    }


}