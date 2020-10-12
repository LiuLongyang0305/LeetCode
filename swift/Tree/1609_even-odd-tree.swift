// https://leetcode.com/problems/even-odd-tree/
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
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        
        func check(_ queue: [TreeNode], _ isOdd: Bool) -> Bool {
            guard queue.count > 1 else {
                return (isOdd && queue[0].val % 2 == 1) || (!isOdd && queue[0].val % 2 == 0)
            }
            let values = queue.map {$0.val}
            
            if !isOdd {
                if let _ = values.firstIndex(where: { $0 % 2 != 0}) {
                    return false
                }
                //decrease
                for i in 1..<values.count {
                    guard values[i] < values[i - 1] else {
                        return false
                    }
                }
            } else {
                if let _ = values.firstIndex(where: { $0 % 2 == 0}) {
                    return false
                }
                // increase
                for i in 1..<values.count {
                    guard values[i] > values[i - 1] else {
                        return false
                    }
                }
            }
            return true
        }
        guard let r = root else {
            return true
        }
        var queue = [r]
        var level = 0
        while !queue.isEmpty {
            guard check(queue, level % 2 == 0) else {
                return false
            }
            var nextLevel = [TreeNode]()
            for node in queue {
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            queue = nextLevel
            level += 1
        }
        return true
    }
}