 //https://leetcode.com/problems/sum-of-nodes-with-even-valued-grandparent/
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
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        var ans = 0
        func dfs(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            if root.val % 2 == 0 {
                if let left = root.left {
                    if let l = left.left {
                        ans += l.val
                    }
                    if let r = left.right {
                        ans += r.val
                    }
                }
                if let right = root.right {
                    if let l = right.left {
                        ans += l.val
                    }
                    if let r = right.right {
                        ans += r.val
                    }
                }
            }
            dfs(root.left)
            dfs(root.right)
        }
        dfs(root)
        return ans
    }
 }
 
 
