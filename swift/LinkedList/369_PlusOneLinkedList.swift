// https://leetcode.com/problems/plus-one-linked-list/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func plusOne(_ head: ListNode?) -> ListNode? {
        guard nil != head else {
            return ListNode(1)
        }
        var nodes = [ListNode?]()
        var temp = head
        while temp != nil {
            nodes.insert(temp, at: 0)
            temp = temp?.next
        }
        var carry = 1
        var i = 0
        while carry == 1 && i < nodes.count{
            let sum = nodes[i]!.val + carry
            carry = sum / 10
            nodes[i]?.val = sum % 10
            i += 1
        }
        guard carry == 1 else {
            return head
        }
        let newHead = ListNode(1)
        newHead.next = head
        return newHead
    }
}
