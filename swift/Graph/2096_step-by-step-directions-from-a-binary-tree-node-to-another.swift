// https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another/
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
    private let N = 1_000_05
    private typealias Edge = (nodeVal:Int,direction:Character)
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        var graph = [[Edge]](repeating: [], count: N)
        
        func dfs(_ node: TreeNode?) {
            guard let n  = node else {return}
            if let l = n.left {
                graph[n.val].append((l.val,"L"))
                graph[l.val].append((n.val,"U"))
                dfs(l)
            }
            if let r = n.right {
                graph[n.val].append((r.val,"R"))
                graph[r.val].append((n.val,"U"))
                dfs(r)
            }
        }
        
        dfs(root)
        
        
        var visited = [Bool](repeating: false, count: N)
        
        var ans = ""
        var path = ""
        func dfs(_ node: Int) {
            guard !visited[node] else {return}
            visited[node] = true
            if node == destValue {
                ans = path
            }
            guard ans.isEmpty else {return}
            for e in graph[node] {
                path.append(e.direction)
                dfs(e.nodeVal)
                path.removeLast()
            }
        }
        dfs(startValue)
        return ans
    }
}

