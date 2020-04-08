// https://leetcode.com/problems/inorder-successor-in-bst/
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
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        var founded = false
        func inorder(_ root: TreeNode?) -> TreeNode?{
            guard let r = root else {
                return nil
            }
            if let node = inorder(r.left) {
                return node
            }
            if r.val == p!.val {
                founded = true
            }
            if founded && r.val > p!.val {
                return r
            }
            if let node = inorder(r.right) {
                return node
            }
            return nil
        }
        return inorder(root)
    }
}
