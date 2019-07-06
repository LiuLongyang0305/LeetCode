//https://leetcode.com/problems/path-sum-iii/
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
    var count = 0
    var currentPath = [Int]()
    var targetSum = 0
    
    func dfs(root: TreeNode?)  {
        guard nil != root else {
            return
        }
        currentPath.append(root!.val)
        var sum = 0
        var i = currentPath.count - 1
        while i >= 0 {
            sum += currentPath[i]
            if sum == targetSum {
                count += 1
            }
            i -= 1
        }
        dfs(root: root?.left)
        dfs(root: root?.right)
        currentPath.removeLast()
    }
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        targetSum = sum
        dfs(root: root)
        return count
    }
}