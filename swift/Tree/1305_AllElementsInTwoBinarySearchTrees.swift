//https://leetcode.com/problems/all-elements-in-two-binary-search-trees/
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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        func inrder(_ root: TreeNode?, ans: inout [Int]) {
            guard let root = root else {
                return
            }
            inrder(root.left, ans: &ans)
            ans.append(root.val)
            inrder(root.right, ans: &ans)
        }
        var treeValues = [Int]()
        inrder(root1, ans: &treeValues)
        inrder(root2, ans: &treeValues)
        return treeValues.sorted()
    }
 }