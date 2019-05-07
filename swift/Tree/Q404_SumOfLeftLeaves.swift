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
class Q404_Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        } else {
            let left =  root?.left
            let right =  root?.right
            if nil == left {
                return sumOfLeftLeaves(right)
            } else {
                if nil == left?.left && nil == left?.right {
                    return (left?.val)! + sumOfLeftLeaves(right)
                } else {
                    return sumOfLeftLeaves(left) + sumOfLeftLeaves(right)
                }
            }
        }
    }
}