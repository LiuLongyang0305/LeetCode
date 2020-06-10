//  https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof/
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var l1 = l1
        var l2 = l2
        
        var mergeListNode: ListNode?
        var curr: ListNode?
        var prev: ListNode?
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                curr = ListNode(l1!.val)
                l1 = l1!.next
            } else {
                curr = ListNode(l2!.val)
                l2 = l2!.next
            }
            if mergeListNode == nil {
                mergeListNode = curr
            }
            if prev != nil {
                prev!.next = curr
            }
            prev = curr
        }
        prev?.next = (l1 != nil ? l1: l2)
        return mergeListNode
    }
}