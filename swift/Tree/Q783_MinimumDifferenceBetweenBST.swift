//https://leetcode.com/problems/minimum-distance-between-bst-nodes/
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

class Q783_Solution {
    var nodeValues = [Int]()
    private func inorderTraversal(_ root: TreeNode?) {
        guard nil != root else {
            return
        }
        inorderTraversal(root?.left)
        nodeValues.append(root!.val)
        inorderTraversal(root?.right)
    }
    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard nil != root && (nil != root?.left || nil != root?.right) else {
            return 0
        }
        inorderTraversal(root)
        var minDiff = Int.max
        for i in 1..<nodeValues.count {
            let dif = nodeValues[i] - nodeValues[i - 1]
            if dif < minDiff {
                minDiff = dif
                if minDiff == 1 {
                    break
                }
            }
        }
        return minDiff
    }
}
