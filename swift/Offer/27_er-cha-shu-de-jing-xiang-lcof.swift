//  https://leetcode-cn.com/problems/er-cha-shu-de-jing-xiang-lcof/
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
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let r = root else {
            return nil
        }
        let right = r.right
        root?.right = mirrorTree(r.left)
        root?.left = mirrorTree(right)
        return root
    }
}