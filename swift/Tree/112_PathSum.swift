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
class Q112_Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if nil == root {
            return false
        } else if nil == root?.left && nil == root?.right {
            return root?.val == sum
        } else {
            let target : Int = sum - (root?.val)!
            return hasPathSum(root?.left,target) || hasPathSum(root?.right,target)
        }
    }
}