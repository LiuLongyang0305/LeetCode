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
class Q538_Solution {
    func convertBSTRecursion(_ root: TreeNode?) -> TreeNode? {
        var sum : Int = 0
        func convertBSTInternal(_ root : TreeNode?) -> TreeNode?{
            guard let node = root else {
                return nil
            }
            convertBSTInternal(node.right)
            sum += node.val
            node.val = sum
            convertBSTInternal(node.left)
            return root
        }
        return convertBSTInternal(root)
    }
    
    func convertBSTIteration(_ root : TreeNode?)-> TreeNode? {
        if nil != root {
            var temp : TreeNode? = root
            var sum : Int = 0
            var stack = Array<TreeNode?>()
            while !stack.isEmpty || nil != temp {
                while nil != temp {
                    stack.append(temp)
                    temp = temp?.right
                }
                temp = stack.removeLast()
                sum += (temp?.val)!
                temp?.val = sum
                temp = temp?.left
            }
        }
        return root
    }
}