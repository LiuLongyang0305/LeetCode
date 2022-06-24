//https://leetcode.com/problems/find-largest-value-in-each-tree-row/
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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let r = root else {return []}
        var  ans = [Int]()
        var queue = [TreeNode]()
        queue.append(r)

        while !queue.isEmpty {
            var newleveL = [TreeNode]()
            var maxVal = Int.min
            for node in queue {
                maxVal = max(maxVal, node.val)
                if let l = node.left {
                    newleveL.append(l)
                }
                if let r = node.right {
                    newleveL.append(r)
                }
            }
            ans.append(maxVal)
            queue = newleveL
        }
        return ans
    }
}