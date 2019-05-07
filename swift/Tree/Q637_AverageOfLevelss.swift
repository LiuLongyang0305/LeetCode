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
class Q637_Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var result = [Double]()
        if nil == root {
            return result
        }
        var queue = Array<TreeNode?>()
        queue.append(root)
        while !queue.isEmpty {
            let length = queue.count
            var sum : Int = 0
            for _ in 0..<length {
                let node : TreeNode? = queue.removeFirst()
                sum += (node?.val)!
                if nil != node?.left {
                    queue.append(node?.left)
                }
                if nil != node?.right {
                    queue.append(node?.right)
                }
            }
            result.append(Double(sum) / Double(length))
        }
        return result
    }
}