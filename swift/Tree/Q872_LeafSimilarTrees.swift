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
class Q872_Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func inorder1(_ root : TreeNode?,_ leaves: inout [Int]) {
            if nil == root {
                return
            }
            inorder1(root?.left,&leaves)
            if nil == root?.left && nil == root?.right {
                leaves.append((root?.val)!)
            }
            inorder1(root?.right,&leaves)
        }
        
        var tree1Leaves = [Int]()
        var tree2Leaves = [Int]()
        inorder1(root1, &tree1Leaves)
        inorder1(root2, &tree2Leaves)
        
        return tree1Leaves == tree2Leaves
    }
}