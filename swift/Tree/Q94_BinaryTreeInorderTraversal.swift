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
class Q94_Solution {
    func inorderTraversalResursion(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func inorder(_ root : TreeNode?){
            if root == nil {
                return
            }
            inorder(root?.left)
            result.append((root?.val)!)
            inorder(root?.right)
        }
        inorder(root)
        return result
    }
    
    func inorderTraversalIteration(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var nodeStack = Array<TreeNode?>()
        var temp = root
        while nil != temp || !nodeStack.isEmpty {
            if nil != temp {
                nodeStack.append(temp)
                temp = temp?.left
            } else {
                temp = nodeStack.popLast()!!
                result.append((temp?.val)!)
                temp = temp?.right
            }
        }
        return result
    }
}