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
class Q662_Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        class AnnotatedNode {
            var node : TreeNode?
            var depth : Int
            var pos : Int
            init(_ node : TreeNode?, _ depth : Int,_ pos: Int) {
                self.node = node
                self.depth = depth
                self.pos = pos
            }
        }
        if nil == root {
            return 0
        }
        var ans : Int = 0
        var nodesQueue = Array<AnnotatedNode>()
        nodesQueue.append(AnnotatedNode(root,0,0))
        var curDepth : Int  = 0
        var left : Int  = 0
        while !nodesQueue.isEmpty {
            let annotatedNode = nodesQueue.removeFirst()
            if nil != annotatedNode.node{
                nodesQueue.append(AnnotatedNode(annotatedNode.node?.left,annotatedNode.depth + 1,annotatedNode.pos * 2 + 1))
                nodesQueue.append(AnnotatedNode(annotatedNode.node?.right,annotatedNode.depth + 1,annotatedNode.pos * 2 + 1))
                if curDepth != annotatedNode.depth {
                    curDepth = annotatedNode.depth
                    left = annotatedNode.pos
                }
                ans = max(ans, annotatedNode.pos - left + 1)
            }
        }
        return ans
    }
}