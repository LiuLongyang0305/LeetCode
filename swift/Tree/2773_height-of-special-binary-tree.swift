//https://leetcode.cn/problems/height-of-special-binary-tree/
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
//  https://leetcode.cn/problems/height-of-special-binary-tree/
 extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

}

class Solution {
    func heightOfTree(_ root: TreeNode?) -> Int {
        return getLength(getAllLeaves(getFirstLeaf(root)), root)
    }

    private func getFirstLeaf(_ root: TreeNode?) -> TreeNode? {

        var visited = Set<TreeNode>()
        var firstLeaf: TreeNode? = nil

        func dfsForLeaf(_ cur: TreeNode?) {
            guard let c = cur else {return}
            guard !visited.contains(c) else {
                firstLeaf = c
                return
            }
            guard nil == firstLeaf else {return}
            visited.insert(c)
            dfsForLeaf(c.left)
            dfsForLeaf(c.right)
        }
        dfsForLeaf(root)
        return firstLeaf
    }

    private func getAllLeaves(_ leaf: TreeNode?) -> Set<TreeNode> {
        var set = Set<TreeNode>()

        func dfs(_ cur: TreeNode?) {
            guard let c = cur else {return}
            guard !set.contains(c) else {return}
            set.insert(c)
            dfs(c.left)
        }
        dfs(leaf)
        return set
    }

    private func getLength(_ leaves: Set<TreeNode>, _ root: TreeNode?) -> Int {
        var depth = 0

        func dfs(_ cur: TreeNode?, _ curDepth: Int) {
            guard let c = cur else {return}
            if leaves.contains(c) {
                depth = max(depth,curDepth)
                return
            }
            dfs(c.left, curDepth + 1)
            dfs(c.right, curDepth + 1)
        }

        dfs(root, 0)
        return depth
    }
}
