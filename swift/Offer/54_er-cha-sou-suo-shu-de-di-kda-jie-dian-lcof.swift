//  https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/
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
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var cnt = 1
        var ans = 0
        func inorder(_ node: TreeNode?) {
            guard let n = node else {
                return
            }
            inorder(n.right)
            // print("\(cnt) : \(n.val)")
            cnt += 1
            guard cnt < k else {
                ans = n.val
                return
            }
            inorder(n.left)
        }
        inorder(root)
        return ans
    }
}