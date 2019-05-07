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
class Q958_Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        if nil == root {
            return true
        }
        class AnnonatedNode{
            var node : TreeNode?
            var position : Int
            init(_ node : TreeNode?,_ position : Int) {
                self.node = node
                self.position = position
            }
        }
        var nodes = Array<AnnonatedNode?>()
        nodes.append(AnnonatedNode(root,1))
        var i : Int = 0
        while i < nodes.count {
            let node = nodes[i]
            i = i + 1
            if nil != node?.node {
                nodes.append(AnnonatedNode(node?.node?.left,2 * (node?.position)!))
                nodes.append(AnnonatedNode(node?.node?.right,2 * (node?.position)! + 1))
            }
        }
        return nodes[i - 1]?.position == nodes.count
    }
    
    func isCompleteTree2(_ root: TreeNode?) -> Bool {
        if nil == root {
            return true
        }
        var nodes = Array<TreeNode?>()
        nodes.append(root)
        var result = true
        var existNilNode = false
        while !nodes.isEmpty && result {
            let length = nodes.count
            for _ in 0..<length{
                let node = nodes.removeFirst()
                if nil != node {
                    nodes.append(node?.left)
                    nodes.append(node?.right)
                } else {
                    existNilNode = true
                }
            }
            let firstNilIndex = nodes.firstIndex {nil == $0}
            let lastNodeindex = nodes.lastIndex { nil != $0}
            result = existNilNode ? (nil == lastNodeindex)  : (nil == firstNilIndex || nil == lastNodeindex || firstNilIndex! > lastNodeindex!)
        }
        return result
    }
}