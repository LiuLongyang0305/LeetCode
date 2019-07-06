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
class Q563_Solution {
    func findTilt(_ root: TreeNode?) -> Int {
        var title : Int = 0
        func getSum(_ root : TreeNode?) -> Int {
            if nil == root {
                return 0
            } else {
                let leftSum = getSum(root?.left)
                let rightSum =  getSum(root?.right)
                title += abs(leftSum - rightSum)
                return (root?.val)! + leftSum + rightSum
            }
        }
        getSum(root)
        return title
    }
}