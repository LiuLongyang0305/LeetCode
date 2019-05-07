//https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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

 class Q109_Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if nil == head {
            return nil
        }
        if nil == head?.next {
            return TreeNode((head?.val)!)
        }
        var fast : ListNode? = head
        var slow : ListNode? = head
        var pre : ListNode? = nil
        while nil != fast && nil != fast?.next{
            pre = nil == pre ? head : slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        let root : TreeNode? = TreeNode((slow?.val)!)
        pre?.next = nil
        root?.left = sortedListToBST(head)
        root?.right = sortedListToBST(slow?.next)
        return root
    }
}