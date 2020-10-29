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
class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var sum = 0
        func dfs(_ root : TreeNode?,_ pathSum: Int) {
            guard let r = root else {
                return
            }
            let currentPathSum = 10 * pathSum + r.val
            if nil == r.left && nil == r.right {
                sum += currentPathSum
            }
            dfs(r.left, currentPathSum)
            dfs(r.right,currentPathSum)
        }
        dfs(root, 0)
        return sum
    }
}
