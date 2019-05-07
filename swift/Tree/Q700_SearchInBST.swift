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
class Q700_Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if nil == root {
            return nil
        } else{
            let value = (root?.val)!
            if value == val {
                return root
            } else if value < val {
                return searchBST(root?.right, val)
            } else {
                return searchBST(root?.left, val)
            }
        }
    }
}