//  https://leetcode-cn.com/problems/sort-linked-list-already-sorted-using-absolute-values/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func sortLinkedList(_ head: ListNode?) -> ListNode? {
        guard let h = head else {return nil}
        guard let _ = h.next else {return h}
        let possitiveHead: ListNode? = ListNode(-1)
        var positiveTail = possitiveHead
        let negativeHead: ListNode? = ListNode(Int.min)
        var negativeTail: ListNode? = nil
        var cur = head
        while let c = cur {
            let next = c.next
            if c.val >= 0 {
                positiveTail?.next = c
                c.next = nil
                positiveTail = c
            } else {
                c.next = negativeHead?.next
                negativeHead?.next = c
                if nil == negativeTail {
                    negativeTail = c
                }
            }
            cur = next
        }
        guard let nt = negativeTail else {return possitiveHead?.next}
        nt.next = possitiveHead?.next
        return negativeHead?.next
    }
}