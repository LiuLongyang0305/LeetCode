 //https://leetcode.com/problems/binary-tree-coloring-game/
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
    func btreeGameWinningMove(_ root: TreeNode?, _ n: Int, _ x: Int) -> Bool {
        //只有一个节点
        guard n > 1 else {
            return false
        }
        //一号玩家直接选择根节点，那么二号玩家只能选择左子树或者右子树
        if x == root!.val {
            let maxColouredBlue = max(counteNode(root?.left), counteNode(root?.right))
            return maxColouredBlue > n - maxColouredBlue
        }
        //找到一号玩家选择的节点
        let nodeColouredRed = findNode(by: x, root: root)
        //计算节点数
        let leftSubtreeNodesNumber = counteNode(nodeColouredRed?.left)
        let rightSubtreeNodesNumber = counteNode(nodeColouredRed?.right)
        let nodesNumber  = 1 + leftSubtreeNodesNumber + rightSubtreeNodesNumber
        //二号玩家三种选择： 一号涂色的节点的左子树，一号涂色的节点的右子树，一号涂色节点的父节点
        let maxColouredBlue = max(leftSubtreeNodesNumber, rightSubtreeNodesNumber, n - nodesNumber)
        return maxColouredBlue > n - maxColouredBlue
    }
    
    private func findNode(by value: Int, root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.val  == value {
            return root
        }
        if let leftNode = findNode(by: value, root: root.left) {
            return leftNode
        }
        return findNode(by: value, root: root.right)
    }
    
    private func counteNode(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let count = counteNode(root.left) + counteNode(root.right) + 1
        return count
    }
 }
