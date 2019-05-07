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
class Q450_Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        func increasingBST2(_ root: TreeNode?) -> TreeNode? {
            if nil == root {
                return nil
            } else {
                let left = root?.left
                let right = root?.right
                
                if nil == left && nil == right {
                    return root
                } else {
                    let leftResult = increasingBST2(left)
                    let rightResult = increasingBST2(right)
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
        
        if nil == root {
            return nil
        }
        if (root?.val)! == key {
            let left = root?.left
            let right = root?.right
            if nil == left && nil == right {
                return nil
            } else {
                if nil == left {
                    return right
                } else if nil == right {
                    return left
                } else {
                    let node = increasingBST2(right)
                    node?.left = left
                    return node
                }
            }
        } else {
            if key < (root?.val)!{
                root?.left = deleteNode(root?.left, key)
            } else {
                root?.right = deleteNode(root?.right, key)
            }
            return root
        }
    }
}