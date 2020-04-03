// https://leetcode.com/problems/closest-binary-search-tree-value/
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
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var ans = Int.max - 1
        var minDistance = Double(Int.max - 1)
        func dfs(_ node: TreeNode?) {
            guard let r = node else {
                return
            }
            let currentDistance = abs(Double(r.val) - target)
            if currentDistance < minDistance {
                minDistance = currentDistance
                ans = r.val
            }
            dfs(r.left)
            dfs(r.right)
        }
        dfs(root)
        return ans
    }
}