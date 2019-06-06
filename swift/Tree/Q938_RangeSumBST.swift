//https://leetcode.com/problems/range-sum-of-bst/
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

class Q938_Solution {

    var left = 0
    var right = 0
    var sum = 0
    private func getSum(root: TreeNode?) {
        guard nil != root else {
            return
        }
        
        if root!.val < left {
            getSum(root: root?.right)
        } else if root!.val > right {
            getSum(root: root?.left)
        } else {
            sum += root!.val
            getSum(root: root?.right)
            getSum(root: root?.left)
        }
        
    }
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        left = L
        right = R
        getSum(root: root)
        return sum
    }
}


