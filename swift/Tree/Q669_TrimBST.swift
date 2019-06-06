//https://leetcode.com/problems/trim-a-binary-search-tree/
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

class Q669_Solution {
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        guard nil != root else {
            return nil
        }
        let val: Int = root!.val
        if val < L {
            return trimBST(root?.right,L,R)
        } else if val > R {
            return trimBST(root?.left,L,R)
        } else {
            root?.left = trimBST(root?.left,L,R)
            root?.right = trimBST(root?.right,L,R)
            return root
        }
    }
}

