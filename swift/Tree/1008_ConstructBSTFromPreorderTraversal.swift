//https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty else {
            return nil
        }
        let root = TreeNode(preorder[0])
        if preorder.count > 1 {
            var leftPreder = [Int]()
            var rightPreder = [Int]()
            for i  in 1..<preorder.count {
                let cur = preorder[i]
                if preorder[i] < preorder[0] {
                    leftPreder.append(cur)
                } else {
                    rightPreder.append(cur)
                }
            }
            
            root.left = bstFromPreorder(leftPreder)
            root.right = bstFromPreorder(rightPreder)
        }
        return root
    }
}