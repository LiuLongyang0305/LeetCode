// https://leetcode.com/problems/swapping-nodes-in-a-linked-list/
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
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        let length = getLengthOf(list: head)
        guard k != length - k + 1 else {
            return head
        }
        
        var kthNode: ListNode? = nil
        var suffixKthNode: ListNode? = nil
        
        var idx = 1
        var curNode = head
        while let _ = curNode {
            if idx == k {
                kthNode = curNode
            }
            if idx == length - k + 1 {
                suffixKthNode = curNode
            }
            idx += 1
            curNode = curNode?.next
        }
        if let a = kthNode?.val {
            kthNode?.val = suffixKthNode!.val
            suffixKthNode?.val = a
        }
        return head
    }
    
    private func getLengthOf(list head: ListNode?) -> Int {
        var length = 0
        var curNode = head
        while let _ = curNode {
            length += 1
            curNode = curNode?.next
        }
        return length
    }
}

