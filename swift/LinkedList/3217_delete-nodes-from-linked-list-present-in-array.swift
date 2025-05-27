
//https://leetcode.com/problems/delete-nodes-from-linked-list-present-in-array/
/*
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
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {

        let set = Set<Int>(nums)
        let newHead: ListNode = ListNode(Int.max)
        newHead.next = head



        var temp = head
        var last:ListNode? = newHead

        while let t = temp {
            temp = t.next
            if set.contains(t.val) {
                last?.next = t.next

            } else {
                last = last?.next
            }

        }
        return newHead.next
    }
}
