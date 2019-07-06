// Definition for a binary tree node.
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
class Q99_Solution {
    func recoverTree(_ root: TreeNode?) {
        var pre : TreeNode? = nil
        var disorderNodes = Array<(TreeNode,TreeNode)>()
        func inorder(_ root : TreeNode?){
            guard let node = root else {
                return
            }
            inorder(node.left)
            if let preNode = pre, preNode.val > node.val {
                disorderNodes.append((preNode,node))
            }
            pre = node
            inorder(node.right)
        }
        inorder(root)
        let wrondNode1 = disorderNodes.first!.0
        let wrondNode2 = disorderNodes.last!.1
        (wrondNode1.val,wrondNode2.val) = (wrondNode2.val,wrondNode1.val)
    }
}