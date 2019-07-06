//https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodespublic
class TreeNode {
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
    var allPaths = [[TreeNode?]]()
    var currentPath = [TreeNode?]()
    var maxLength = 0
    func preorderTraversal(_ root : TreeNode?) {
        guard nil != root else {
            return
        }
        currentPath.append(root)
        if nil == root?.left && nil == root?.right {
            let length = currentPath.count
            if length > maxLength {
                maxLength = length
                allPaths.removeAll()
                allPaths.append(currentPath)
            } else if maxLength == length {
                allPaths.append(currentPath)
            }
        }
        preorderTraversal(root?.left)
        preorderTraversal(root?.right)
        
        currentPath.popLast()
    }
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        preorderTraversal(root)
        guard allPaths.count > 1 else {
            return allPaths.first?.last ?? nil
        }
        var commonRoot: TreeNode? = nil
        for i in 0..<maxLength {
            if nil == commonRoot {
                let target = (allPaths[0][i])!.val
                for j in 1..<allPaths.count {
                    if (allPaths[j][i]?.val)! != target {
                        commonRoot = allPaths[0][i - 1]
                        break
                    }
                }
            } else {
                break
            }
        }
        
        return commonRoot
    }
}


class Solution2 {
    var allPaths = [[Int]]()
    var currentPath = [Int]()
    var maxLength = 0
    var valueToNodes = Dictionary<Int,TreeNode?>()
    func preorderTraversal(_ root : TreeNode?) {
        guard nil != root else {
            return
        }
        currentPath.append(root!.val)
        valueToNodes[root!.val] = root
        if nil == root?.left && nil == root?.right {
            let length = currentPath.count
            if length > maxLength {
                maxLength = length
                allPaths.removeAll()
                allPaths.append(currentPath)
            } else if maxLength == length {
                allPaths.append(currentPath)
            }
        }
        preorderTraversal(root?.left)
        preorderTraversal(root?.right)
        
        currentPath.popLast()
    }
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        preorderTraversal(root)
        guard allPaths.count > 1 else {
            return (valueToNodes[allPaths[0].last!])!!
        }
        var commonRoot: TreeNode? = nil
        for i in 0..<maxLength {
            if nil == commonRoot {
                let target = allPaths[0][i]
                for j in 1..<allPaths.count {
                    if allPaths[j][i] != target {
                        commonRoot = (valueToNodes[allPaths[0][i - 1]])!!
                        break
                    }
                }
            } else {
                break
            }
        }
        return commonRoot
    }
}
