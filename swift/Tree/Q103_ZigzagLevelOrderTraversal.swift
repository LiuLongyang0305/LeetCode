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
class Q103_Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if nil == root {
            return result
        }
        var nodeQueue = Array<TreeNode?>()
        nodeQueue.append(root)
        var rightDiection = true
        while !nodeQueue.isEmpty {
            let length = nodeQueue.count
            var currentLevel = [Int]()
            for i in 0..<length {
                let node = nodeQueue[length - 1 - i]
                currentLevel.append((node?.val)!)
                if rightDiection {
                    if nil != node?.left {
                        nodeQueue.append(node?.left)
                    }
                    if nil != node?.right {
                        nodeQueue.append(node?.right)
                    }
                } else {
                    if nil != node?.right {
                        nodeQueue.append(node?.right)
                    }
                    if nil != node?.left {
                        nodeQueue.append(node?.left)
                    }
                }
            }
            nodeQueue.replaceSubrange(0..<length, with: [])
            result.append(currentLevel)
            rightDiection = !rightDiection
        }
        return result
    }
}