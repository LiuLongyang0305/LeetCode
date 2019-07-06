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
class Q993_Solution {
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var xParent : TreeNode? = nil
        var yParent : TreeNode? = nil
        if nil == root {
            return false
        }
        
        var nodes = Array<TreeNode?>()
        var parent = Array<TreeNode?>()
        
        parent.append(nil)
        nodes.append(root)
        
        while !nodes.isEmpty {
            let length = nodes.count
            for _ in 0..<length {
                
                let node = nodes.removeFirst()
                let nodeParent = parent.removeFirst()
                
                if x == (node?.val)!{
                    xParent = nodeParent
                }
                if y == (node?.val){
                    yParent = nodeParent
                }
                if nil != node?.left {
                    nodes.append(node?.left)
                    parent.append(node)
                }
                if nil != node?.right {
                    nodes.append(node?.right)
                    parent.append(node)
                }
            }
            if nil != xParent || nil != yParent {
                return nil != xParent && nil != yParent && xParent !== yParent
            }
        }
        return false
    }
}