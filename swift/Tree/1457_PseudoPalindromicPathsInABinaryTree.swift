// https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var ans = 0
        var counter = Array<Int>(repeating: 0, count: 10)
        func dfs(_ node: TreeNode?) {
            guard let n = node else {
                return
            }
            counter[n.val] += 1
            if nil == n.left && nil == n.right {
                let cnt = counter.reduce(0) { $0 + $1 % 2}
                if cnt <= 1 {
                    ans += 1
                }
            }
            dfs(n.left)
            dfs(n.right)
            counter[n.val] -= 1
        }
        dfs(root)
        return ans
    }
}

