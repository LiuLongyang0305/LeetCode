//https://leetcode.com/problems/deepest-leaves-sum/
class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        var map: [Int: Int] = [:]
        var maxDepth = 0
        var sum = 0
        func dfs(_ node: TreeNode?, depth: Int) {
            guard let node  = node  else {
                return
            }
            guard nil != node.left || nil != node.right else {
                if depth > maxDepth {
                    maxDepth = depth
                    sum = node.val
                } else if maxDepth == depth {
                    sum +=  node.val
                }
                return
            }
            dfs(node.left, depth: depth + 1)
            dfs(node.right, depth: depth + 1)
        }
        dfs(root, depth: 0)
        return sum
    }
 }

