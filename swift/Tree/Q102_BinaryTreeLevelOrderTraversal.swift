// Definition for a binary tree node.
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

class Q102_Solution {
    func levelOrderBFS(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if nil == root {
            return result
        }
        var queue = Array<TreeNode?>()
        queue.append(root)
        while !queue.isEmpty {
            var currentLevel = [Int]()
            let levelSize = queue.count
            for _ in 0..<levelSize {
                let node : TreeNode? = queue.removeFirst()
                currentLevel.append((node?.val)!)
                if nil != node?.left {
                    queue.append(node?.left)
                }
                if nil != node?.right {
                    queue.append(node?.right)
                }
            }
            result.append(currentLevel)
        }
        return result
    }
    func levelOrderDFS(_ root: TreeNode?) -> [[Int]] {
        
        var result = [[Int]]()
        if nil == root {
            return result
        }
        func _dfs(node: TreeNode?,level : Int){
            if nil == node {
                return
            }
            if result.count < level + 1 {
                result.append([Int]())
            }
            result[level].append((node?.val)!)
            _dfs(node: node?.left, level: level + 1)
            _dfs(node: root?.right, level: level + 1)
        }
        _dfs(node: root, level: 0)
        return result
    }
}