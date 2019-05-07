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
class Q144_Solution {
    func preorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func preorder(_ currentRoot : TreeNode?) {
            if nil == currentRoot {
                return
            }
            result.append((currentRoot?.val)!)
            preorder(currentRoot?.left)
            preorder(currentRoot?.right)
        }
        preorder(root)
        return result
    }
    
    func preorderTraversalIteration(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if nil != root {
            var nodesStack = Array<TreeNode?>()
            nodesStack.append(root)
            while !nodesStack.isEmpty {
                let temp : TreeNode = nodesStack.popLast()!!
                result.append(temp.val)
                if nil != temp.right {
                    nodesStack.append(temp.right)
                }
                if nil != temp.left {
                    nodesStack.append(temp.left)
                }
            }
        }
        return result
    }
}