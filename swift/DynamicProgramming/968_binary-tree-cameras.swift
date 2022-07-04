// https://leetcode.com/problems/binary-tree-cameras/
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
    private typealias Triple = (ByParent:Int,ByChildren: Int,BySelf:Int)
    private let INF = 1000000000
    func minCameraCover(_ root: TreeNode?) -> Int {



        func dfs(_ node: TreeNode?) -> Triple {
            guard let n = node else {
                return (0,0,INF)
            }
            var ans: Triple = (INF,INF,INF)
            let lt = dfs(n.left)
            let rt = dfs(n.right)
            ans.ByParent = min(lt.BySelf, lt.ByChildren) + min(rt.ByChildren, rt.BySelf)
            ans.BySelf = min(lt.ByParent,lt.ByChildren,lt.BySelf) + min(rt.BySelf, rt.ByChildren,rt.ByParent) + 1
            ans.ByChildren = min(lt.BySelf + min(rt.BySelf, rt.ByChildren), rt.BySelf + min(lt.ByChildren,lt.BySelf))
            return ans
        }

        let triple = dfs(root)
        return min(triple.ByChildren, triple.BySelf)
    }
}
