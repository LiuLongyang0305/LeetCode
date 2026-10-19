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
    //  https://leetcode.cn/problems/zigzag-level-sum-of-binary-tree/
    class Solution {
        func zigzagLevelSum(_ root: TreeNode?) -> [Int] {
            var levelTreeNodes = [Int: [TreeNode]]()

            func dfs(_ level: Int, _ node: TreeNode?) {
                guard let n = node else {return}
                levelTreeNodes[level,default: []].append(n)
                dfs(level + 1, n.left)
                dfs(level + 1, n.right)
            }

            dfs(1, root)
            var ans = [Int](repeating: 0, count: levelTreeNodes.count)

            for (level,nodes) in levelTreeNodes {
                var sum = 0
                //偶数
                if level & 1 == 0 {
                    for n in nodes.reversed() {
                        guard let _ = n.right else {break}
                        sum += n.val
                    }


                } else {
                    //奇数
                    for n in nodes {
                        guard let _ = n.left else {break}
                        sum += n.val
                    }
                }
                ans[level - 1] = sum
            }

            return ans
        }
    }
