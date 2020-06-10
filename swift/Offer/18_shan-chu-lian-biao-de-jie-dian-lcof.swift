// https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        if let v = head?.val, v == val {
            return head?.next
        }
        head?.next = deleteNode(head?.next, val)
        return head
    }
}