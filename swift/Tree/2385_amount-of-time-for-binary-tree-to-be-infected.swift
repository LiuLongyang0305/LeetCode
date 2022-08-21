// https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/
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
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        var tree = [Int:[Int]]()
        func dfs(_ node: TreeNode?) {
            guard let n = node else {return}
            if let l = n.left {
                tree[n.val,default: []].append(l.val)
                tree[l.val,default: []].append(n.val)
                dfs(l)
            }
            if let r = n.right {
                tree[n.val,default: []].append(r.val)
                tree[r.val,default: []].append(n.val)
                dfs(r)
            }
        }
        dfs(root)
        var ans = 0
        var visited = [Bool](repeating: false, count: 100005)
        visited[start] = true
        var queue = [start]
        while !queue.isEmpty {
            ans += 1
            var newQueue = [Int]()
            for node in queue {
                for next in tree[node] ?? [] {
                    if !visited[next] {
                        newQueue.append(next)
                        visited[next] = true
                    }
                }
            }
            queue = newQueue
        }
        return ans - 1
    }
}
