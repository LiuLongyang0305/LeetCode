//https://leetcode.com/problems/insufficient-nodes-in-root-to-leaf-paths/
 class Solution {
    func sufficientSubset(_ root: TreeNode?, _ limit: Int) -> TreeNode? {

        guard let rootVal = root?.val else { return nil }
        guard root?.left !== root?.right else {
            return rootVal < limit ? nil : root
        }
        root?.left = sufficientSubset(root?.left, limit -  rootVal)
        root?.right = sufficientSubset(root?.right, limit - rootVal)
        return  root?.left === root?.right ? nil : root
    }
 }