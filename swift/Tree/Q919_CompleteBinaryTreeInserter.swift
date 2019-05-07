//https://leetcode.com/problems/complete-binary-tree-inserter/
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

class CBTInserter {
    var root : TreeNode?
    var unCompleteNodes = Array<TreeNode?>()
    init(_ root: TreeNode?) {
        self.root = root
        travelVerse(root)
    }
    
    func insert(_ v: Int) -> Int {
        let parent : TreeNode? = unCompleteNodes.first!
        let node = TreeNode(v)
        if nil == parent?.left {
            parent?.left = node
        } else {
            parent?.right = node
            unCompleteNodes.removeFirst()
        }
        unCompleteNodes.append(node)
        return (parent?.val)!
    }
    
    func get_root() -> TreeNode? {
        return root
    }
    
    func travelVerse(_ root: TreeNode?)  {
        if nil == root {
            return
        }
        var nodesQueue = Array<TreeNode?>()
        nodesQueue.append(root)
        while !nodesQueue.isEmpty {
            let length = nodesQueue.count
            for _ in 0..<length {
                let temp = nodesQueue.removeFirst()
                if nil == temp?.left || nil == temp?.right{
                    unCompleteNodes.append(temp)
                }
                if nil != temp?.left{
                    nodesQueue.append(temp?.left)
                }
                if nil != temp?.right{
                    nodesQueue.append(temp?.right)
                }
            }
        }
    }
}

/**
 * Your CBTInserter object will be instantiated and called as such:
 * let obj = CBTInserter(root)
 * let ret_1: Int = obj.insert(v)
 * let ret_2: TreeNode? = obj.get_root()
 */