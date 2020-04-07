// https://leetcode.com/problems/count-univalue-subtrees/
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
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var ans = 0
        func checkIsLeaf(_ node: TreeNode?) -> Bool {
            return nil == node?.left && nil == node?.right
        }
        func dfs(_ root: TreeNode?) -> Bool {
            guard !checkIsLeaf(root) else {
                ans += 1
                return true
            }
            guard let root = root else {
                return false
            }
            var flag = true
            if let l = root.left {
                let leftAns = dfs(l)
                flag = flag && leftAns && root.val == l.val
            }
            if let r = root.right {
                let rightAns = dfs(r)
                flag = flag && rightAns && r.val == root.val
            }
            if flag {
                ans += 1
            }
            return flag
        }
        dfs(root)
        return ans
    }
}
