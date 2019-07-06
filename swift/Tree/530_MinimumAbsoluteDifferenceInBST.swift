//https://leetcode.com/problems/minimum-absolute-difference-in-bst/
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

class Q530_Solution {
    var nodesVales = [Int]()
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var result = Int.max
        inoederTraverse(root: root)
        for i in 1..<nodesVales.count {
            result = min(result, nodesVales[i] - nodesVales[i - 1])
        }
        return result
    }
    private func inoederTraverse(root : TreeNode?){
        guard nil != root else {
            return
        }
        inoederTraverse(root: root?.left)
        nodesVales.append(root!.val)
        inoederTraverse(root: root?.right)
    }
}
