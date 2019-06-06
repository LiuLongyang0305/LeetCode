//https://leetcode.com/problems/maximum-binary-tree-ii/
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

class Q998_Solution {
    
    func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard nil != root else {
            return nil
        }
        let tempNode = TreeNode(val)
        if val > root!.val {
            tempNode.left = root
            return tempNode
        }  else {
            if nil == root?.right {
                root?.right = tempNode
            } else {
                root?.right = insertIntoMaxTree(root?.right,val)
            }
            return root
        }
    }
}