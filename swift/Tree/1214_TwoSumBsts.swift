//https://leetcode.com/problems/two-sum-bsts/
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
    func twoSumBSTs(_ root1: TreeNode?, _ root2: TreeNode?, _ target: Int) -> Bool {
        var tree1Values = Set<Int>()
        func dfs1(_ root: TreeNode?) {
            guard let r = root else {
                return
            }
            tree1Values.insert(r.val)
            dfs1(r.left)
            dfs1(r.right)
        }
        dfs1(root1)
        
        func dfs(_ root: TreeNode?) -> Bool {
            guard let r = root else {
                return false
            }
            guard !tree1Values.contains(target - r.val) else {
                return true
            }
            guard !dfs(r.left) else {
                return true
            }
            return dfs(r.right)
        }
        return dfs(root2)
    }
}
