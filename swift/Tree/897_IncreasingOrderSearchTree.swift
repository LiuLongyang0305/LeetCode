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
class Q897_Solution {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        if nil == root {
            return nil
        } else {
            let left = root?.left
            let right = root?.right
            
            if nil == left && nil == right {
                return root
            } else {
                let leftResult = increasingBST(left)
                let rightResult = increasingBST(right)
                if nil == left {
                    root?.right = rightResult
                    rightResult?.left = nil
                    root?.left = nil
                    return root
                } else {
                    root?.right = rightResult
                    if nil == left?.right {
                        left?.right = root
                    } else {
                        var temp : TreeNode? = left
                        while nil != temp?.right {
                            temp = temp?.right
                        }
                        temp?.right = root
                    }
                    root?.left = nil
                    leftResult?.left = nil
                    rightResult?.left = nil
                    return leftResult
                }
            }
        }
    }
}