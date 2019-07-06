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
class Q257_Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if nil == root {
            return [String]()
        } else if nil == root?.left && nil == root?.right {
            return ["\((root?.val)!)"]
        } else {
            var left = binaryTreePaths(root?.left)
            let right = binaryTreePaths(root?.right)
            left.append(contentsOf: right)
            for i in 0..<left.count {
                left[i] = "\((root?.val)!)->" + left[i]
            }
            return left
        }
    }
}