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
class Q814_Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        func getSubTreeSum(_ root : TreeNode?) -> Int {
            if nil == root?.left && nil == root?.right {
                return (root?.val)!
            }
            let left : TreeNode? = root?.left
            let right : TreeNode? = root?.right
            var leftSubTreeSum = 0
            var rightSubTreeSum = 0
            if nil != left{
                leftSubTreeSum = getSubTreeSum(left)
                if 0 == leftSubTreeSum {
                    root?.left = nil
                }
            }
            if nil != right{
                rightSubTreeSum = getSubTreeSum(right)
                if 0 == rightSubTreeSum {
                    root?.right = nil
                }
            }
            return (root?.val)! + leftSubTreeSum + rightSubTreeSum
        }
        if nil == root {
            return nil
        }
        if nil == root?.left && nil == root?.right && 0 == (root?.val)!{
            return nil
        }
        getSubTreeSum(root)
        return root
    }
    
    func pruneTree2(_ root: TreeNode?) -> TreeNode? {
        func containsNodesOne(_ root : TreeNode?) -> Bool {
            if nil == root {
                return false
            }
            let left = containsNodesOne(root?.left)
            let right = containsNodesOne(root?.right)
            if !left {
                root?.left = nil
            }
            if !right {
                root?.right = nil
            }
            return 1 == (root?.val)! || left || right
        }
        return containsNodesOne(root) ? root : nil
    }
}