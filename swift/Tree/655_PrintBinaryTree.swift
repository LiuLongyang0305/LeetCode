//https://leetcode.com/problems/print-binary-tree/
class TreeNode {
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
    var result = [[String]]()
    var depth = -1
    func maxDepth(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        if nil == root?.left && nil == root?.right {
            return 1
        }
        
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
    private func dfs(root: TreeNode?,level: Int,position: Int)  {
        guard nil != root else {
            return
        }
        result[level][position] = "\(root!.val)"
        let deltaPosition = Int(pow(2.0, Double(depth - level - 1))) - 1
        dfs(root: root?.left, level: level + 1, position: position - deltaPosition)
        dfs(root: root?.right, level: level + 1, position: position + deltaPosition)
    }
    func printTree(_ root: TreeNode?) -> [[String]] {
        depth = maxDepth(root)
        let lastLevelNodesNum = Int(pow(2.0, Double(depth))) - 1
        result = Array<Array<String>>(repeating: Array<String>(repeating: "", count: lastLevelNodesNum ), count:depth)
        dfs(root: root, level: 0, position: lastLevelNodesNum / 2)
        return result
    }
}
