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
class BSTIterator {
    var stack : Array<TreeNode?> = []
    init(_ root: TreeNode?) {
        addElements(root)
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        let node = stack.popLast()!
        addElements(node?.right)
        return (node?.val)!
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
    func addElements(_ root : TreeNode?)  {
        if nil != root {
            var temp : TreeNode? = root
            while nil != temp {
                stack.append(temp)
                temp = temp?.left
            }
        }
    }
    
}