// https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/
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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var depth = 0
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [TreeNode]()
            for node in queue {
                if let l = node.left {
                    nextLevel.append(l)
                }
                if let r = node.right {
                    nextLevel.append(r)
                }
            }
            queue = nextLevel
        }
        return depth
    }
}