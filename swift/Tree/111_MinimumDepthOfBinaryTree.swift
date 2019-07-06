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
class Q111_Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        
        if nil == root?.left || nil == root?.right {
            return 1
        }
        let leftDepth = minDepth(root?.left)
        let rightDepth = minDepth(root?.right)
        return 1 + ((0 == leftDepth || 0 == rightDepth ) ? (leftDepth + rightDepth) : min(leftDepth, rightDepth))
    }
}