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
class Q617_Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if nil == t1 || nil == t2 {
            return nil == t1 ? t2 : t1
        } else {
            t1?.val = (t1?.val)! + (t2?.val)!
            t1?.left = mergeTrees(t1?.left, t2?.left)
            t1?.right = mergeTrees(t1?.right, t2?.right)
            return t1
        }
    }
}