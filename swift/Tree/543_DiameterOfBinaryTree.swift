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
class Q543_Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        var maxLength = 0;
        func getDepth(_ root : TreeNode?) -> Int{
            if root == nil {
                return 0
            } else {
                let left = getDepth(root?.left)
                let right = getDepth(root?.right)
                let len = 1 + left + right
                if len > maxLength {
                    maxLength = len
                }
                return 1 + max(left, right)
            }
        }
        getDepth(root)
        return maxLength - 1
    }
}

 class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        func dfs(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            let left = dfs(root.left)
            let right = dfs(root.right)
            diameter = max(diameter, left + right)
            return max(left, right)
        }
        dfs(root)
        return diameter
    }
 }

 class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var ans = Int.min


        func dfs(_ node:TreeNode?) -> Int {
            guard let node = node else {
                return 0
            }
            let l = dfs(node.left)
            let r = dfs(node.right)
            ans = max(ans, l + r + 1)
            return 1 + max(l, r)
        }
        let _ = dfs(root)
        return ans - 1
    }
}

