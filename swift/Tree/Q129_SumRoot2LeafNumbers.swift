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
class Q129_Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var sum = 0
        var currentPathSum = 0
        func dfs(_ root : TreeNode?) {
            if nil == root {
                return
            }
            currentPathSum = 10 * currentPathSum + (root?.val)!
            if nil == root?.left && nil == root?.right {
                sum += currentPathSum
            }
            if nil != root?.left {
                dfs(root?.left)
            }
            if nil != root?.right {
                dfs(root?.right)
            }
            currentPathSum = (currentPathSum - (root?.val)!) / 10
        }
        dfs(root)
        return sum
    }
}