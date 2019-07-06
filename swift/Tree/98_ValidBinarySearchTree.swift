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
class Q98_Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        if nil == root{
            return true
        }
        func isBSTHelper(_ root : TreeNode?,_ lowerLimit:Int?,_ upperLimit : Int?) -> Bool {
            if nil != lowerLimit && (root?.val)! <= lowerLimit!{
                return false
            }
            if nil != upperLimit && (root?.val)! >= upperLimit! {
                return false
            }
            let left = nil != root?.left ? isBSTHelper(root?.left, lowerLimit, root?.val) : true
            if left {
                let right = nil != root?.right ? isBSTHelper(root?.right, root?.val, upperLimit) : true
                return right
            } else {
                return false
            }
        }
        return isBSTHelper(root, nil, nil)
    }
    
    func isValidBST2(_ root: TreeNode?) -> Bool {
        var result = true
        var preValue : Int? = nil
        func inorder(_ root : TreeNode?) {
            if result {
                if nil == root {
                    return
                }
                inorder(root?.left)
                if nil != preValue {
                    if (root?.val)! <= preValue! {
                        result  = false
                    }
                }
                preValue = root?.val
                inorder(root?.right)
            }
        }
        inorder(root)
        return result
    }
}