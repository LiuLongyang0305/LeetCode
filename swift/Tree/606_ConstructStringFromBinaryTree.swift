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
class Q606_Solution {
    func tree2str(_ t: TreeNode?) -> String {
        if nil == t {
            return ""
        } else {
            let left = t?.left
            let right = t?.right
            if nil == left && nil == right {
                return String((t?.val)!)
            } else {
                let rightResult = tree2str(t?.right)
                return String((t?.val)!) + "(\(tree2str(left)))" + (rightResult.isEmpty ? "" : "(\(rightResult))")
            }
        }
    }
}