// https://leetcode.com/problems/binary-tree-longest-consecutive-sequence-ii/
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
    private typealias MaxLength = (increase: Int, decrease:Int)
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var maxLength = 0
        func longestPath(_ root: TreeNode?) -> MaxLength {
            guard let root = root else {
                return (0,0)
            }
            var inr = 1
            var dcr = 1
            if let left = root.left {
                let ans = longestPath(left)
                if root.val == left.val + 1 {
                    dcr = ans.decrease + 1
                } else if root.val == left.val - 1 {
                    inr = ans.increase + 1
                }
            }
            if let right = root.right {
                let ans = longestPath(right)
                if root.val == right.val + 1 {
                    dcr = max(dcr, ans.decrease + 1)
                } else if root.val == right.val - 1 {
                    inr = max(inr, ans.increase + 1)
                }
            }
            maxLength = max(maxLength, dcr + inr - 1)
            return (inr,dcr)
        }
        longestPath(root)
        return maxLength
    }
}
