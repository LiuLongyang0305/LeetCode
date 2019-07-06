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
class Q965_Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        if nil == root {
            return true
        }
        if nil == root?.left && nil == root?.right {
            return true
        }
        let left = root?.left
        let right = root?.right
        
        let leftResult = isUnivalTree(root?.left)
        let rightResult = isUnivalTree(root?.right)
        
        if nil == left {
            return rightResult && root?.val == right?.val
        } else if nil == right {
            return leftResult && root?.val == left?.val
        } else {
            return leftResult && root?.val == left?.val && root?.val == right?.val && rightResult
        }
    }
}