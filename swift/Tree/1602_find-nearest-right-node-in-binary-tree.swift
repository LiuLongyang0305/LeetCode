// https://leetcode.com/problems/find-nearest-right-node-in-binary-tree/
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
    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let r = root, let u = u else {
            return nil
        }
        guard r.val != u.val else {
            return nil
        }
        var queue = [r]
        while !queue.isEmpty {
            var nextLevel = [TreeNode]()
            var idx: Int? = nil;
            for node in queue {
                if let left = node.left {
                    if left.val == u.val {
                        idx = nextLevel.count
                    }
                    nextLevel.append(left)
                }
                if let right = node.right {
                    if right.val == u.val {
                        idx = nextLevel.count
                    }
                    nextLevel.append(right)
                }
            }
            // print(nextLevel.map{$0.val})
            if let i = idx {
                return i == nextLevel.count - 1 ? nil : nextLevel[i + 1]
            }
            queue = nextLevel
        }
        return nil
    }
}
