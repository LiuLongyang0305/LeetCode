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
class Q145_Solution {
    func postorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func postotder(currentRoot : TreeNode?) {
            if nil == currentRoot {
                return
            }
            postotder(currentRoot: currentRoot?.left)
            postotder(currentRoot: currentRoot?.right)
            result.append((currentRoot?.val)!)
        }
        postotder(currentRoot: root)
        return result
    }
    
    func postorderTraversalIteration(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if nil != root {
            var nodesStack1 = Array<TreeNode?>()
            var nodesStack2 = Array<TreeNode?>()
            nodesStack1.append(root)
            while !nodesStack1.isEmpty {
                let temp = nodesStack1.popLast()!!
                nodesStack2.append(temp)
                if nil != temp.left {
                    nodesStack1.append(temp.left)
                }
                if nil != temp.right {
                    nodesStack1.append(temp.right)
                }
            }
            while !nodesStack2.isEmpty {
                result.append(nodesStack2.popLast()!!.val)
            }
        }
        return result
    }
}