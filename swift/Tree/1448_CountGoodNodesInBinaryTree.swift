//  https://leetcode.com/problems/count-good-nodes-in-binary-tree/
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
    func goodNodes(_ root: TreeNode?) -> Int {
        var ans = 0
        func dfs(_ node: TreeNode?, _ maxValue: Int) {
            guard let n = node else {
                return
            }
            if n.val >= maxValue {
                ans += 1
            }
            dfs(n.left, max(maxValue, n.val))
            dfs(n.right, max(maxValue, n.val))
        }
        dfs(root, Int.min)
        return ans
    }
}
