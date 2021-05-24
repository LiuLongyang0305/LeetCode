//https://leetcode.com/problems/remove-duplicates-from-an-unsorted-linked-list/
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
    func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
        guard nil != head else {
            return nil
        }
        let curHead: ListNode? = ListNode(-1, head)
        var cnt = Array<Int>(repeating: 0, count: 100001)
        var temp = head
        while let node = temp {
            cnt[node.val] += 1
            temp = temp?.next
        }
        var last = curHead
        var cur = curHead?.next
        
        while let c = cur {
            if cnt[c.val] > 1 {
                last?.next = cur?.next
                cur = cur?.next
            } else {
                last = last?.next
                cur = cur?.next
            }
        }
        return curHead?.next
    }
}
