//https://leetcode.com/problems/binary-tree-maximum-path-sum/
class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    var maxSum: Int = Int.min
    private func maxSumAtRoot(root: TreeNode?) -> Int {
   
        if nil == root {
            return 0
        }
        
        let maxLeft = max(0, maxSumAtRoot(root: root?.left))
        let maxRight = max(0, maxSumAtRoot(root: root?.right))
        
        let val = root!.val
        let maxAtRoot = val + max(maxRight, maxLeft)
        maxSum = max(maxSum, val + maxRight + maxLeft)
        return maxAtRoot
    }
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxSumAtRoot(root: root)
        return maxSum
    }
}