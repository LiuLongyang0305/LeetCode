// https://leetcode.com/problems/merge-nodes-in-between-zeros/
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
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var next = head?.next
        var pre = head
        
        while let n = next {
            if n.val == 0 {
                if let _ = n.next {
                    pre?.next = n
                    pre = pre?.next
                }
            } else {
                pre?.val += n.val
            }
            next = next?.next
        }
        pre?.next = nil
        return head
    }
}
