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
class Q199_Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result = Array<Int>()
        if nil != root {
            var nodes = Array<TreeNode?>()
            nodes.append(root)
            while !nodes.isEmpty {
                result.append(nodes.last!!.val)
                let length = nodes.count
                for _ in 0..<length {
                    let temp : TreeNode = nodes.remove(at: 0)!
                    if nil != temp.left{
                        nodes.append(temp.left)
                    }
                    if nil != temp.right {
                        nodes.append(temp.right)
                    }
                }
            }
        }
        return result
    }
}