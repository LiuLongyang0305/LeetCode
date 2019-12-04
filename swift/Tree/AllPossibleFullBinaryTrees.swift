//https://leetcode.com/problems/all-possible-full-binary-trees/
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
    private static var memo = [Int:[TreeNode]]()
    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        guard nil == Solution.memo[N] else {
            return Solution.memo[N]!
        }
        var roots = [TreeNode]()
        if N == 1 {
            roots.append(TreeNode(0))
        } else if N % 2 == 1 {
            for x in 0..<N {
                let y = N -  1 - x
                for left in allPossibleFBT(x) {
                    for right in allPossibleFBT(y) {
                        let bns = TreeNode(0)
                        bns.left = left
                        bns.right = right
                        roots.append(bns)
                    }
                }
            }
        }
        Solution.memo[N] = roots
        return Solution.memo[N]!
    }
 }
