// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
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
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let r = root else {
            return []
        }
        var ans = [Int]()
        var queue = [TreeNode]()
        queue.append(r)
        while !queue.isEmpty {
            var nextLevel = [TreeNode]()
            for node in queue {
                ans.append(node.val)
                if let l = node.left {
                    nextLevel.append(l)
                }
                if let r = node.right {
                    nextLevel.append(r)
                }
            }
            queue = nextLevel
        }
        return ans
    }
}