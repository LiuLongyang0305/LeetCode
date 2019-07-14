//https://leetcode.com/contest/weekly-contest-145/problems/lowest-common-ancestor-of-deepest-leaves/
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

extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
}

class Solution {
    typealias TreeNodeInfo = (parent: TreeNode?, level: Int)
    var info = Dictionary<TreeNode?,TreeNodeInfo>()
    var maxLevel = 0
    func traverse(root: TreeNode?, level: Int)  {
        if root == nil {
            return
        }
        let tempLexel =  level + 1
        if nil != root?.left {
            if tempLexel > maxLevel {
                maxLevel =  tempLexel
            }
            info[root?.left] = (root, tempLexel)
            traverse(root: root?.left, level: tempLexel)
        }
        if nil != root?.right {
            if tempLexel > maxLevel {
                maxLevel =  tempLexel
            }
            info[root?.right] = (root, tempLexel)
            traverse(root: root?.right, level: tempLexel)
        }
    }
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        traverse(root: root, level: 0)
        info[root] = (nil,0)
        let depestLeaves = info.filter { (arg0) -> Bool in
            let (_, value) = arg0
            return value.level == maxLevel
        }
        if depestLeaves.count == 1{
            return depestLeaves.first!.key
        }
        var currentSet = Set<TreeNode?>(depestLeaves.keys)
        while currentSet.count > 1 {
            var parents = Set<TreeNode?>()
            for node in currentSet {
                parents.insert(info[node]?.parent)
            }
            currentSet = parents
        }
        return currentSet.first!
    }
}


