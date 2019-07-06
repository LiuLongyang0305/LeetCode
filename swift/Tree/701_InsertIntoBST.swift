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
class Q701_Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if nil == root {
            return TreeNode(val)
        }
        var temp : TreeNode? = root
        while nil != temp {
            let isLeft = (temp?.val)! > val
            if isLeft {
                if nil == temp?.left {
                    temp?.left = TreeNode(val)
                    temp = nil
                } else {
                    temp = temp?.left
                }
            } else {
                if nil == temp?.right {
                    temp?.right = TreeNode(val)
                    temp = nil
                } else {
                    temp = temp?.right
                }
            }
        }
        return root
    }
}