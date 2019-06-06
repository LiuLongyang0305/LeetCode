//https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
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
class Q1022_Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var sum = 0
        var currentPath = 0
        func dfs(root: TreeNode?)  {
            guard nil != root else {
                return
            }
            
            currentPath = currentPath  << 1 + root!.val
            if nil == root?.left && nil == root?.right {
                sum += currentPath
            }
            dfs(root: root?.left)
            dfs(root: root?.right)
            currentPath >>= 1
        }
        dfs(root: root)
        return sum
    }
}