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
class Q543_Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        var maxLength = 0;
        func getDepth(_ root : TreeNode?) -> Int{
            if root == nil {
                return 0
            } else {
                let left = getDepth(root?.left)
                let right = getDepth(root?.right)
                let len = 1 + left + right
                if len > maxLength {
                    maxLength = len
                }
                return 1 + max(left, right)
            }
        }
        getDepth(root)
        return maxLength - 1
    }
}