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
class Q951_Solution {
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if nil == root1 && nil == root2 {
            return true
        }
        if nil == root1 || nil == root2 || root2?.val != root1?.val {
            return false
        }
        
        return (flipEquiv(root1?.left,root2?.left) && flipEquiv(root1?.right,root2?.right)) || (flipEquiv(root1?.left,root2?.right) && flipEquiv(root1?.right,root2?.left))
    }
}