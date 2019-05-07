//https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if nil == root {
            return result
        }
        var queue = Array<TreeNode?>()
        queue.append(root)
        while !queue.isEmpty {
            var currentLevel = [Int]()
            let levelSize = queue.count
            for _ in 0..<levelSize {
                let node : TreeNode? = queue.removeFirst()
                currentLevel.append((node?.val)!)
                if nil != node?.left {
                    queue.append(node?.left)
                }
                if nil != node?.right {
                    queue.append(node?.right)
                }
            }
            result.insert(currentLevel, at: 0)    
        }
        return result
    }
}