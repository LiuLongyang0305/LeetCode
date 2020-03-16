//https://leetcode.com/problems/balance-a-binary-search-tree/
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
    private var values = [TreeNode]()
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ node: TreeNode?, _ values: inout [TreeNode]) {
            guard let node = node else {
                return
            }
            dfs(node.left,&values )
            values.append(node)
            dfs(node.right,&values)
        }
        values = []
        dfs(root,&values)
        return buildBalancedBST(0,values.count - 1)
    }
    private func buildBalancedBST(_ left: Int, _ right: Int) -> TreeNode? {
        guard right >= left else {
            return nil
        }
        guard right > left else {
            values[left].left = nil
            values[left].right = nil
            return values[left]
        }
        let mid = (right + left) >> 1
        values[mid].right = buildBalancedBST(mid + 1, right)
        if mid != left {
            values[mid].left = buildBalancedBST(left, mid - 1)
        } else {
            values[mid].left = nil
        }
        return values[mid]
    }
}
