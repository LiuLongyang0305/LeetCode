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
class Solution {
    private typealias Pair = (notBeRobbed:Int,robbed:Int)
    func rob(_ root: TreeNode?) -> Int {

        func  dfs(_ node: TreeNode?) -> Pair {

            guard let node = node else {
                return (0,0)
            }

            var ans: Pair = (0,0)
            ans.robbed += node.val
            if let l = node.left {
                let leftAns = dfs(l)
                ans.notBeRobbed += max(leftAns.notBeRobbed, leftAns.robbed)
                ans.robbed += leftAns.notBeRobbed
            }
            if let r = node.right {
                let rightAns = dfs(r)
                ans.notBeRobbed += max(rightAns.notBeRobbed, rightAns.robbed)
                ans.robbed += rightAns.notBeRobbed
            }
            return ans
        }

        let res = dfs(root)
        return max(res.notBeRobbed,res.robbed)
    }
}