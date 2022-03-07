// https://leetcode.com/problems/create-binary-tree-from-descriptions/
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
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var valToNode = [Int:TreeNode]()
        var isRoot = [Int:Bool]()
        
        
        for d in descriptions {
            let (p,c,f) = (d[0],d[1],d[2] == 1)
            if nil == valToNode[p] {
                valToNode[p] = TreeNode(p)
            }
            if nil == valToNode[c] {
                valToNode[c] = TreeNode(c)
            }
            if f {
                valToNode[p]?.left = valToNode[c]
            } else {
                valToNode[p]?.right = valToNode[c]
            }
            if let t = isRoot[c] {
                if t {
                    isRoot[c] = false
                }
            }
            if nil == isRoot[p] {
                isRoot[p] = true
            }
        }
        
        for (v,flag) in isRoot {
            if flag {
                return valToNode[v]
            }
        }
        return nil
    }
}