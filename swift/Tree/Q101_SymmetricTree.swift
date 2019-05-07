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
class Q101_Solution {
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        func isMirror(_ s: TreeNode? , _ t : TreeNode?) -> Bool{
            let falg1 = nil != s
            let falg2 = nil != t
            return falg1 && falg2 ? (s?.val == t?.val && isMirror(s?.left, t?.right) && isMirror(s?.right, t?.left)) : (!falg2 &&  !falg1)
        }
        
        return nil != root ? isMirror(root?.left, root?.right) : true
    }
}