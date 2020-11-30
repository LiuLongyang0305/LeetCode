// https://leetcode.com/problems/merge-in-between-linked-lists/
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
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var cnt = -1
        var node = list1
        var aNodePre: ListNode? = nil
        var bNodeNext: ListNode? = nil
        
        let list1Head: ListNode? = ListNode()
        var temp = list1Head
        
        list1Head?.next = list1
        while let n = node, cnt <= b {
            cnt += 1
            if cnt == a {
                aNodePre = temp
            }
            if cnt == b {
                bNodeNext = node?.next
            }
            node = n.next
            temp = temp?.next
        }
        var list2Tail = list2
        while let n = list2Tail?.next {
            list2Tail = n
        }
        aNodePre?.next = list2
        list2Tail?.next = bNodeNext
        return list1Head?.next
    }
}