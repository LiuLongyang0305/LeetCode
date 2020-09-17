// https://leetcode.com/problems/delete-n-nodes-after-m-nodes-of-a-linked-list/
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
    func deleteNodes(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        return deleteNodesInner(head, m, n)
    }
    private func deleteNodesInner(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var curHead = head
        var last: ListNode? = nil
        var cnt = 0
        while cnt < m && curHead != nil {
            cnt += 1
            last = curHead
            curHead = curHead?.next
        }
        cnt = 0
        while cnt < n && curHead != nil {
            cnt += 1
            curHead = curHead?.next
        }
        last?.next = deleteNodesInner(curHead, m, n)
        return head
    }
}
