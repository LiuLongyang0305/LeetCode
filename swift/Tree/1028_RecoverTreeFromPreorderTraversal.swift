//https://leetcode.com/problems/recover-a-tree-from-preorder-traversal/
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
    
    struct NodeInfo {
        var value: Int
        var level: Int
    }
    
    private func createBinaryTree(nodesInfo: [NodeInfo]) -> TreeNode? {
        typealias TreeNodeLevel = (node: TreeNode?, level: Int)
        let root: TreeNode? = TreeNode(nodesInfo[0].value)
        var nodesList = [TreeNodeLevel]()
        nodesList.append((root,nodesInfo[0].level))
        for i in 1..<nodesInfo.count {
            let node = TreeNode(nodesInfo[i].value)
            if nodesInfo[i].level - nodesInfo[i - 1 ].level > 0 {
                nodesList.last!.node?.left = node
            } else {
                while nodesList.last!.level >= nodesInfo[i].level  {
                    nodesList.removeLast()
                }
                nodesList.last!.node?.right = node
            }
            nodesList.append((node,nodesInfo[i].level))
        }
        return root
    }
    private func getNodesInfo(_ str: String) -> [NodeInfo] {
        var nodes = [NodeInfo]()
        let parts = str.split(separator: "-")
        var nodesValues = parts.map { (subStr) -> Int in
            return Int(String(subStr))!
        }
        
        var levels = [Int]()
        levels.append(0)
        
        var current = 0
        for ch in str {
            if ch == "-" {
                current += 1
            } else {
                if current != 0{
                    levels.append(current)
                }
                current = 0
            }
        }
        
        for i in 0..<levels.count {
            nodes.append(NodeInfo(value: nodesValues[i], level: levels[i]))
        }
        return nodes
    }
    func recoverFromPreorder(_ S: String) -> TreeNode? {
        guard !S.isEmpty else {
            return nil
        }
        let nodes = getNodesInfo(S)
        return createBinaryTree(nodesInfo: nodes)
    }
}

