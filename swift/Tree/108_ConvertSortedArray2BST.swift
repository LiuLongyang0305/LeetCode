// Definition for a binary tree node.
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
class Q108_Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        } else {
            let mid = nums.count / 2
            let val = nums[nums.count / 2]
            let node = TreeNode(val)
            node.left = sortedArrayToBST(Array<Int>(nums[0..<mid]))
            node.right = sortedArrayToBST(Array<Int>(nums[(mid + 1)..<nums.count]))
            return node
        }
    }
}