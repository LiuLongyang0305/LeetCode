//https://leetcode.cn/problems/median-of-a-binary-search-tree-level/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func levelMedian(_ root: TreeNode?, _ level: Int) -> Int {
        var values = [Int]()

        func dfs(_ curNode: TreeNode?, _ curLevel: Int) {
            guard let cur = curNode else {return}
            dfs(cur.left, curLevel + 1)
            if curLevel == level {
                values.append(cur.val)
            }
            dfs(cur.right, curLevel + 1)
        }
        dfs(root, 0)
        guard !values.isEmpty else {return -1}
        let N = values.count
        return values[N / 2]
    }
}
