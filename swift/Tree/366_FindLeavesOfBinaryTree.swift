// https://leetcode.com/problems/find-leaves-of-binary-tree/
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
    var ans = [[Int]]()
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else {
            return []
        }
        var index = 0
        let currentRoot = TreeNode(Int.max)
        currentRoot.left = r
        while let r = currentRoot.left {
            dfs(r, index, currentRoot, true)
            index += 1
        }
        return ans
    }
    private func dfs(_ root: TreeNode?, _ index: Int, _ parent: TreeNode?,_ leftNode: Bool) {
        guard let r = root else {
            return
        }
        if r.left == nil && r.right == nil {
            if ans.count < index + 1 {
                ans.append([])
            }
            ans[index].append(r.val)
            if let p = parent {
                if leftNode {
                    p.left = nil
                } else {
                    p.right = nil
                }
            }
            return
        }
        dfs(r.left, index, r, true)
        dfs(r.right, index, r, false)
    }
}
