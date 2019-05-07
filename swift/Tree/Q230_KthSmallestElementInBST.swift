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
class Q230_Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var nodeValues = [Int]()
        var nodeStack = Array<TreeNode?>()
        var temp = root
        while nil != temp || !nodeStack.isEmpty && nodeValues.count < k{
            if nil != temp {
                nodeStack.append(temp)
                temp = temp?.left
            } else {
                temp = nodeStack.popLast()!!
                nodeValues.append((temp?.val)!)
                temp = temp?.right
            }
        }
        return nodeValues.last!
    }
}