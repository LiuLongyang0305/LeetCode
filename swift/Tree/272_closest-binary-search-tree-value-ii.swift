// https://leetcode.com/problems/closest-binary-search-tree-value-ii/
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
    func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
        var map = [Int: Double]()
        func inorder(_ node: TreeNode?) {
            guard let r = node else {
                return
            }
            inorder(r.left)
            map[r.val] = fabs(Double(r.val) - target)
            inorder(r.right)
        }
        inorder(root)
        let sortedMap = map.sorted { (arg0, arg1) -> Bool in
            let (_, value1) = arg1
            let (_, value0) = arg0
            return value0 < value1
        }
        return sortedMap[0..<k].map { $0.key}
    }
}
