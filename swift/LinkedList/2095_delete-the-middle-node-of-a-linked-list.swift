// https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/
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
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        guard let _ = head?.next else {
            return nil
        }
        let mid = getCnt(head) / 2
        var idx = 1
        var pre = head
        var cur = head?.next
        while idx < mid {
            pre = cur
            cur = cur?.next
            idx += 1
        }
        pre?.next = cur?.next
        cur?.next = nil
        return head
    }
    
    private func  getCnt(_ head: ListNode?) -> Int {
        var cnt = 0
        var t = head
        while let _ = t {
            cnt += 1
            t = t?.next
        }
        return cnt
    }
}