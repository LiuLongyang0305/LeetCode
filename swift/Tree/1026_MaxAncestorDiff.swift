//https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/
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

class Q1026_Solution {
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var max: Int = 0
        var currentPath = [Int]()
        func dfs(root: TreeNode?)  {
            guard nil != root else {
                return
            }
            currentPath.append(root!.val)
            if nil == root?.left && nil == root?.right {
                let tempMax: Int = currentPath.max()! - currentPath.min()!
                if tempMax > max {
                    max = tempMax
                }
            }
            dfs(root: root?.left)
            dfs(root: root?.right)
            currentPath.popLast()
        }
        dfs(root: root)
        return max
    }
}