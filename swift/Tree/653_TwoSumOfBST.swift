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
class Q653_Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var visitedSet = Set<Int>()
        var flag = false
        func inorder(_ root : TreeNode?) {
            if flag {
                return
            }
            if nil == root {
                return
            }
            inorder(root?.left)
            if visitedSet.contains(k - (root?.val)!){
                flag = true
                return
            } else {
                visitedSet.insert((root?.val)!)
            }
            inorder(root?.right)
        }
        inorder(root)
        return flag
    }
}