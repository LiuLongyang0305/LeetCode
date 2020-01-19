//https://leetcode.com/problems/delete-leaves-with-a-given-value/
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
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        var count = 0
        func dfs(parent: TreeNode?, currentRoot: TreeNode?, isLeft: Bool) {
            guard let current = currentRoot else {
                return
            }
            if current.val == target &&  current.left == nil && current.right == nil {
                count += 1
                if isLeft {
                    parent?.left = nil
                } else {
                    parent?.right = nil
                }
            } else {
                dfs(parent: current , currentRoot: current.left, isLeft: true)
                dfs(parent: current, currentRoot: current.right, isLeft: false)
            }
        }
        while true {
            count = 0
            dfs(parent: nil, currentRoot: root, isLeft: true)
            if root!.val == target && root?.left == nil && root?.right == nil {
                return nil
            }
            if count == 0 {
                break
            }
        }
        return root
    }
 }