// https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
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

class Q1038_Solution {
    var sum = 0
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        bstToGstRecursion(root)
        return root
    }
    func bstToGstRecursion(_ root: TreeNode?)  {
        if nil == root{
            return
        }
        bstToGstRecursion(root?.right)
        sum += root!.val
        root?.val = sum
        bstToGstRecursion(root?.left)
    }
}
