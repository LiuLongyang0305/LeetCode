// https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/

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
    func longestZigZag(_ root: TreeNode?) -> Int {
        var maxLength = 0
        func dfs(_ root: TreeNode?, _ isLeftTree: Bool,_ currentLength: Int) {
            guard let root = root else {
                maxLength = max(maxLength, currentLength)
                return
            }
            if isLeftTree {
                dfs(root.right, false, currentLength + 1)
                dfs(root.left, false, 0)
            } else {
                dfs(root.left, true, currentLength + 1)
                dfs(root.right, true, 0)
            }
        }
        dfs(root, true, 0)
        dfs(root, false, 0)
        return maxLength - 1
    }
 }