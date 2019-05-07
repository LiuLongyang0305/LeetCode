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
class Q104_Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        if nil == root?.left && nil == root?.right {
            return 1
        }
        
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
}