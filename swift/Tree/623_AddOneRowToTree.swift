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
class Q623_Solution {
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        var queue = Array<TreeNode?>()
        guard nil != root else {
            return root
        }
        //add row in front of the root
        guard 1 != d else {
            let node : TreeNode? = TreeNode(v)
            node?.left = root
            return node
        }
        queue.append(root)
        var index = 1
        while !queue.isEmpty && index < d - 1 {
            let length = queue.count
            for _ in 0..<length {
                let temp = queue.removeFirst()
                
                if nil != temp?.left{
                    queue.append(temp?.left)
                }
                if nil != temp?.right {
                    queue.append(temp?.right)
                }
            }
            index += 1
        }
        for node in queue{
            //            var node = queue.removeFirst()
            let left = node?.left
            let right = node?.right
            node?.left = TreeNode(v)
            node?.left?.left = left
            node?.right = TreeNode(v)
            node?.right?.right = right
        }
        return root
    }
}