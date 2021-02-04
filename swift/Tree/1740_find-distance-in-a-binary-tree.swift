// https://leetcode.com/problems/find-distance-in-a-binary-tree
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
    func findDistance(_ root: TreeNode?, _ p: Int, _ q: Int) -> Int {
        guard p != q else {
            return 0
        }
        var pathOfP = [Int]()
        var pathOfQ = [Int]()
        func dfs(_ node: TreeNode?, _ curPath: inout [Int]) {
            guard let n = node else {
                return
            }
            curPath.append(n.val)
            if n.val == p {
                pathOfP = curPath
            }
            if n.val == q {
                pathOfQ = curPath
            }
            dfs(n.left, &curPath)
            dfs(n.right,&curPath)
            curPath.removeLast()
        }
        var curPath = [Int]()
        dfs(root, &curPath)
        
        var idx = 0
        while idx < pathOfQ.count && idx < pathOfP.count && pathOfQ[idx] == pathOfP[idx] {
            idx += 1
        }
        return pathOfQ.count + pathOfP.count - idx * 2
    }
}
