// https://leetcode.com/problems/height-of-binary-tree-after-subtree-removal-queries/

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
    func treeQueries(_ root: TreeNode?, _ queries: [Int]) -> [Int] {

        var depths = [Int]()
        var inTime = [Int:Int]()
        var outTime = [Int:Int]()

        var ts = 0
        func dfs(_ node: TreeNode?, _ level: Int) {
            guard let node = node else {return}
            depths.append(level)
            inTime[node.val] = ts
            ts += 1
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
            outTime[node.val] = ts
        }

        dfs(root, 0)
        let M = depths.count
        var leftMax = [Int](repeating: 0, count: M + 1)

        var rightMax = [Int](repeating: 0, count: M + 1)
        for i in 0..<M {
            leftMax[i + 1] = max(leftMax[i], depths[i])
            rightMax[M - 1 - i] = max(rightMax[M - 1 - i + 1],depths[M - 1 - i])
        }
        return queries.map { removed in
            let L = inTime[removed]!
            let R = outTime[removed]!
            return max(leftMax[L],rightMax[R])

        }

    }
}
