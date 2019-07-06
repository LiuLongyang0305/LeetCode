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

class Q226_Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if nil == root {
            return nil
        } else {
            let temp = root?.left
            root?.left = invertTree(root?.right)
            root?.right = invertTree(temp)
            return root
        }
    }
}