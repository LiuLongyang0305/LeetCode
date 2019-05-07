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
//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q114_Solution {
    func flatten(_ root: TreeNode?) {
        if nil == root || (nil == root?.left && nil == root?.right){
            return
        }
        let left = root?.left
        let right = root?.right
        if nil == left || nil == right {
            if nil == left {
                flatten(right)
            } else {
                flatten(left)
                root?.right = left
                root?.left = nil
            }
        } else {
            flatten(left)
            flatten(right)
            root?.right = left
            root?.left = nil
            var temp : TreeNode? = left
            while nil != temp?.right {
                temp = temp?.right
            }
            temp?.right = right
            temp?.left = nil
        }
    }
}