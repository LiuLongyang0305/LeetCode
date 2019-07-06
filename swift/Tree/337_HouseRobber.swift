//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/
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

//This solution will exceed time limit when excute the last test case.
class Solution {
    func dfs(root: TreeNode?, isRobbed: Bool) -> Int {
        guard nil != root else {
            return 0
        }

        let leftMoneyRobbed = dfs(root: root?.left, isRobbed: false)
        let rightMoneyRobbed = dfs(root: root?.right, isRobbed: false)
        if isRobbed {
            return leftMoneyRobbed + root!.val + rightMoneyRobbed
        } else {
            let leftMoneyNotRobbed = max(leftMoneyRobbed, dfs(root: root?.left, isRobbed: true))
            let rightMoneyNotRobbed = max(rightMoneyRobbed, dfs(root: root?.right, isRobbed: true))
            return leftMoneyNotRobbed + rightMoneyNotRobbed
        }
    }
    
    func rob(_ root: TreeNode?) -> Int {
        return max(dfs(root: root, isRobbed: false), dfs(root: root, isRobbed: true))
    }
}

//This solution works well.
class Solution2 {
    typealias RobbedResult = (notRobbed: Int,robbed: Int)
    func dfs(root: TreeNode?) -> RobbedResult {
        var result: RobbedResult = (0,0)
        guard nil != root else {
            return result
        }

        result.robbed += root!.val
        if nil != root?.left {
            
        }
        if nil != root?.right {
            let leftResult : RobbedResult = dfs(root: root?.left)
            result.notRobbed += max(leftResult.notRobbed, leftResult.robbed)
            result.robbed += leftResult.notRobbed
        }
        if nil != root?.right {
            let rightResult: RobbedResult = dfs(root: root?.right)
            result.notRobbed += max(rightResult.robbed, rightResult.notRobbed)
            result.robbed += rightResult.notRobbed
        }
        return result
    }
    func rob(_ root: TreeNode?) -> Int {
        let result = dfs(root: root)
        return result.notRobbed > result.robbed ? result.notRobbed : result.robbed
    }
}