// https://leetcode.com/problems/find-root-of-n-ary-tree/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

extension Node {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
}
class Solution {
    func findRoot1(_ tree: [Node]) -> Node? {
        var visited = Set<Node>()
        var parent = [Node:Node]()
        func dfs(_ node: Node) {
            guard !visited.contains(node) else {
                return
            }
            visited.insert(node)
            guard !node.children.isEmpty else {
                return
            }
            for neighbor in node.children {
                parent[neighbor] = node
                dfs(neighbor)
            }
        }
        for node in tree {
            dfs(node)
        }
        var curNode = tree[0]
        while let p = parent[curNode] {
            curNode = p
        }
        return curNode
    }
    
    func findRoot(_ tree: [Node]) -> Node? {
        var xOrSum = 0
        for node in tree {
            xOrSum ^= node.val
            for child in node.children {
                xOrSum ^= child.val
            }
        }
        for node in tree {
            if node.val == xOrSum {
                return node
            }
        }
        return nil
    }
}
