//https://leetcode.com/problems/binary-tree-maximum-path-sum/
class TreeNode {
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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = Int.min


        func dfs(_ node: TreeNode?) -> Int {

            guard let n = node else {
                return 0
            }

            let l = max(0,dfs(n.left))
            let r = max(0,dfs(n.right))
            ans = max(ans, n.val + l + r)
            return n.val + max(l,r)
        }
        dfs(root)
        return ans
    }
}