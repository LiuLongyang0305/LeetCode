// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else {
            return []
        }
        var ans = [[Int]]()
        var queue = [TreeNode]()
        queue.append(r)
        var flag = false
        while !queue.isEmpty {
            var nextLevel = [TreeNode]()
            var values = [Int]()
            for node in queue {
                values.append(node.val)
                if let l = node.left {
                    nextLevel.append(l)
                }
                if let r = node.right {
                    nextLevel.append(r)
                }
            }
            if !flag {
                ans.append(values)
            } else {
                ans.append(values.reversed())
            }
            flag = !flag
            queue = nextLevel
        }
        return ans
    }
}