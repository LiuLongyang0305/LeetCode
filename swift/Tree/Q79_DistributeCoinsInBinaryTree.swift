//https://leetcode.com/problems/distribute-coins-in-binary-tree/
//solution:https://leetcode.com/problems/distribute-coins-in-binary-tree/discuss/271774/C%2B%2B-8ms-beat-100-with-picture-explanation
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
    var ans = 0
    private func dfs(_ root: TreeNode?) -> Int {
        guard nil != root else {
            return 0
        }
        if let left = root?.left {
            root?.val = root!.val + dfs(left)
        }
        if let right = root?.right {
            root?.val = root!.val + dfs(right)
        }
        let temp = root!.val - 1
        ans += abs(temp)
        return temp
    }
    func distributeCoins(_ root: TreeNode?) -> Int {
        dfs(root)
        return ans
    }
}
