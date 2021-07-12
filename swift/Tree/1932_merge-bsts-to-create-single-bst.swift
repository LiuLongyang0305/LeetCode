// https://leetcode.com/problems/merge-bsts-to-create-single-bst/
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
    func canMerge(_ trees: [TreeNode?]) -> TreeNode? {
        //保证leaf_value唯一
        var leavesValue = Set<Int>()
        for root in trees {
            if let left = root?.left {
                guard !leavesValue.contains(left.val) else {
                    return nil
                }
                leavesValue.insert(left.val)
            }
            if let right = root?.right {
                guard !leavesValue.contains(right.val) else {
                    return nil
                }
                leavesValue.insert(right.val)
            }
        }
        // print("**************    1")
        //保证只有一个可以作为根
        var include = 0
        var finalRoot: TreeNode? = nil
        for root in trees {
            if let r = root {
                if leavesValue.contains(r.val) {
                    include += 1
                } else {
                    finalRoot = root
                }
            }
        }
        guard include + 1 == trees.count else {
            return nil
        }
        // print("**************    2")

        //构造map:  val -> tree
        var map = [Int:TreeNode]()
        for root in trees {
            guard let r = root else {
                continue
            }
            map[r.val] = root
        }
        
        //合并
        
        func dfs1(_ root: TreeNode?) {
            guard let r = root else {
                return
            }
            if let left = r.left {
                if let nextRoot = map[left.val] {
                    r.left = nextRoot
                    map.removeValue(forKey: left.val)
                }
            }
            if let right = r.right {
                if let nextRoot = map[right.val] {
                    r.right = nextRoot
                    map.removeValue(forKey: right.val)
                }
            }
            dfs1(r.left)
            dfs1(r.right)
        }
        dfs1(finalRoot)
        guard map.count == 1 else {
            return nil
        }
         // print("**************    3")

        //验证
        func dfs(_ root: TreeNode?, _ nums: inout [Int])  {
            guard let r = root else {
                return
            }
            dfs(r.left, &nums)
            nums.append(r.val)
            dfs(r.right, &nums)
        }
        var nums = [Int]()
        dfs(finalRoot, &nums)
        var last = -1
        for num in nums {
            guard num > last else {
                return nil
            }
            last = num
        }
        return finalRoot
    }
}