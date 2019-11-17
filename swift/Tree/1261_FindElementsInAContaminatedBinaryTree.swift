//https://leetcode.com/problems/find-elements-in-a-contaminated-binary-tree/
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

class FindElements {
    
    private var root: TreeNode?
    private var map = [Int:Set<Int>]()
    init(_ root: TreeNode?) {
        func recoverBinaryTree(root: TreeNode?, val: Int) {
            guard root != nil else {
                return
            }
            if map[val] == nil {
                map[val] = []
            }
            if root?.left != nil {
                let temp = val << 1  + 1
                root?.left?.val = temp
                map[val]?.insert(temp)
                recoverBinaryTree(root: root?.left, val: temp)
            }
            if root?.right != nil {
                let temp = val << 1  + 2
                root?.right?.val = temp
                map[val]?.insert(temp)
                recoverBinaryTree(root: root?.right, val:temp)
            }
        }
        self.root = root
        if nil != root {
            self.root?.val = 0
            recoverBinaryTree(root: root, val: 0)
        }
    }
    
    func find(_ target: Int) -> Bool {
        return map[target] != nil
    }
}

