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

class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [TreeNode] = [root]
        var ans = -1
        while !queue.isEmpty {
            var nextLevel = [TreeNode]()
            ans = 0
            for node in queue {
                ans += node.val
                if let l = node.left {
                    nextLevel.append(l)
                }
                if let r = node.right {
                    nextLevel.append(r)
                }
            }
            queue = nextLevel
        }
        return ans
    }
}
