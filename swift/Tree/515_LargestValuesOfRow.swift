//https://leetcode.com/problems/find-largest-value-in-each-tree-row/
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
    func largestValues(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard nil != root else {
            return result
        }
        var queue = [TreeNode?]()
        queue.append(root)
        while !queue.isEmpty {
            let levelSize = queue.count
            var max: Int = queue[0]!.val
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                if node!.val > max {
                    max = node!.val
                }
                if nil != node?.left {
                    queue.append(node?.left)
                }
                if nil != node?.right {
                    queue.append(node?.right)
                }
            }
            result.append(max)
        }
        return result
    }
}