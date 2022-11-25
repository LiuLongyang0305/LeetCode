// https://leetcode.com/problems/closest-nodes-queries-in-a-binary-search-tree/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func closestNodes(_ root: TreeNode?, _ queries: [Int]) -> [[Int]] {

        var sortedNums = [Int]()

        func dfs(_ treeNode:TreeNode?) {
            guard let node = treeNode else {
                return
            }
            dfs(node.left)
            sortedNums.append(node.val)
            dfs(node.right)
        }

        dfs(root)

        sortedNums = [-1] + sortedNums + [Int.max]

        func binarySearch(_ target: Int) -> Int {
            var left = 0
            var right = sortedNums.count - 1
            while left < right {
                let mid = (left + right + 1) >> 1
                if sortedNums[mid] > target {
                    right = mid - 1
                }  else {
                    left = mid
                }
            }
            return left
        }

        var ans = [[Int]]()

        for target in queries {
            let idx = binarySearch(target)
            if sortedNums[idx] == target {
                ans.append([target,target])
            } else {
                ans.append([sortedNums[idx],sortedNums[idx + 1] == Int.max ? -1 : sortedNums[idx + 1]])
            }
        }



        return ans
    }
}