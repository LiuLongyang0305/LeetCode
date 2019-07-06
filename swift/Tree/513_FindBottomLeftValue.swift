//https://leetcode.com/problems/find-bottom-left-tree-value/
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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard nil != root?.left || nil != root?.right else {
            return root!.val
        }
        var result: Int = root!.val
        var queue = [TreeNode?]()
        queue.append(root)
        
        while !queue.isEmpty {
            let levelSize = queue.count
            result = queue[0]!.val
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                if nil != node?.left {
                    queue.append(node?.left)
                }
                if nil != node?.right {
                    queue.append(node?.right)
                }
            }
        }
        return result
    }
}