//// https://leetcode.com/problems/linked-list-in-binary-tree/

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
 
 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }
 
 
 class Solution {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        
        func check(_ treeNode: TreeNode?, _ currentListNode: ListNode?) -> Bool {
            guard let currentListNode = currentListNode else {
                return true
            }
            
            guard let treeNode = treeNode, treeNode.val == currentListNode.val else {
                return false
            }
            return check(treeNode.left, currentListNode.next) || check(treeNode.right, currentListNode.next)
        }
        
        func dfs(_ treeNode: TreeNode?) -> Bool {
            guard let treeNode = treeNode else {
                return false
            }
            if treeNode.val == head!.val {
                guard !check(treeNode, head) else {
                    return true
                }
            }
            guard !dfs(treeNode.left) else {
                return true
            }
            return dfs(treeNode.right)
        }
        return dfs(root)
    }
 }
 
 
