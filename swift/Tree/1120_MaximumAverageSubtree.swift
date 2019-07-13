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

class Solution {
    typealias TreeSumAndCount = (sum: Int, count: Int)
    var maxAverage = 0.0
    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        guard root != nil else {
            return 0.0
        }
        getTreeSumAndCount(root: root)
        return maxAverage
    }
    
    func getTreeSumAndCount(root: TreeNode?) -> TreeSumAndCount {
        var ans: TreeSumAndCount = (0,0)
        ans.sum = root!.val
        ans.count = 1
        if root?.left != nil {
            let left = getTreeSumAndCount(root: root?.left)
            ans.sum += left.sum
            ans.count += left.count
        }
        if root?.right != nil {
            let right = getTreeSumAndCount(root: root?.right)
            ans.sum += right.sum
            ans.count += right.count
        }
        let ave = Double(ans.sum) / Double(ans.count)
        if ave > maxAverage {
            maxAverage = ave
        }
        return ans
    }
}
