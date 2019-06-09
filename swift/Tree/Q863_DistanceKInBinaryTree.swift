//https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/
//TODO
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
    
    var result = [Int]()
    var isFindTargrt = false
    //        var ancestors = [TreeNode?]()
    var ancestors = [Int]()
    private func dfsToFindAncestors(root: TreeNode?, target: Int) {
        //    private func dfsToFindAncestors(root: TreeNode?, target: Int, ancestors: inout [TreeNode?]) {
        guard !isFindTargrt else {
            return
        }
        guard nil != root else {
            return
        }
        //        ancestors.append(root)
        ancestors.append(root!.val)
        if root!.val == target {
            isFindTargrt = true
        }
        dfsToFindAncestors(root: root?.left, target: target)
        dfsToFindAncestors(root: root?.right, target: target)
        ancestors.popLast()
    }
    private func dfs(root: TreeNode?) {
        guard nil != root else {
            return
        }
        ancestors.append(root!.val)
        if root?.left == nil && root?.right == nil {
            print(ancestors)
        }
        dfs(root: root?.left)
        dfs(root: root?.right)
        
    }
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
//        dfsToFindAncestors(root: root, target: target!.val)
        dfs(root: root)
        return result
    }
}
