//https://leetcode.com/problems/find-duplicate-subtrees/
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
    var result = [TreeNode?]()
    var treeString = Set<String>()
    var appendedSubtree = Set<String>()
    private func dfs(root: TreeNode?) -> String {
        guard nil != root else {
            return ""
        }
        
        var hash: String = "\(root!.val)"
        hash = hash + "L" + dfs(root: root?.left)
        hash = hash + "R" + dfs(root: root?.right)
        if treeString.contains(hash) {
            if !appendedSubtree.contains(hash){
                result.append(root)
                appendedSubtree.insert(hash)
            }
        } else {
            treeString.insert(hash)
        }
        return hash
    }
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        dfs(root: root)
        return result
    }
}