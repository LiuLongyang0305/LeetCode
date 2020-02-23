// https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/

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
    private let MOD = 1_000_000_007
    func maxProduct(_ root: TreeNode?) -> Int {
        var subTreeSum = [Int]()
        func dfs(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            
            let left = dfs(root.left)
            let right = dfs(root.right)
            let sum = right + left + root.val
            subTreeSum.append(sum)
            return sum
        }
        
        let totalSum = dfs(root)
        var ans = Int.min
        for sum in subTreeSum {
            ans = max(ans, (totalSum - sum) * sum)
        }
        return ans % MOD
    }
 }
 

 


