//https://leetcode.com/problems/equal-tree-partition/
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

class Solution {
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        var subtreeSum = [Int]()
        func dfs(_ root: TreeNode?) -> Int? {
            guard let r = root else {
                return nil
            }
            var ans = r.val
            if let l = dfs(r.left) {
                ans += l
            }
            if let r = dfs(r.right) {
                ans += r
            }
            subtreeSum.append(ans)
            return ans
        }
        guard let totalSum = dfs(root), totalSum % 2 == 0 else {
            return false
        }
        guard subtreeSum.count > 1 else {
            return false
        }
        guard let index = subtreeSum.firstIndex(of: totalSum >> 1) else {
            return false
        }
        return index != subtreeSum.count - 1
    }
}
