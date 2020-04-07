// https://leetcode.com/problems/binary-tree-longest-consecutive-sequence/
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
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var maxLength = 0
        
        func solve(_ currentPath: [Int]) {
            guard currentPath.count >= maxLength else {
                return
            }
            guard currentPath.count > 1 else {
                maxLength = max(maxLength, 1)
                return
            }
            
            var currentLength = 1
            for i in 1..<currentPath.count {
                if currentPath[i] == currentPath[i - 1] + 1{
                    currentLength += 1
                } else {
                    maxLength = max(currentLength, maxLength)
                    currentLength = 1
                }
            }
            maxLength = max(currentLength, maxLength)
        }
        
        func dfs(_ root: TreeNode?,_ currentPath: inout [Int]) {
            guard let root = root else {
                return
            }
            currentPath.append(root.val)
            if nil == root.left && nil == root.right {
                solve(currentPath)
            } else {
                dfs(root.left, &currentPath)
                dfs(root.right, &currentPath)
            }
            currentPath.removeLast()
        }
        var path = [Int]()
        dfs(root, &path)
        return maxLength
    }
}
