//  https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        let currentHead = ListNode(Int.min)
        var node = head
        while let n = node {
            node = node?.next
            n.next = currentHead.next
            currentHead.next = n
        }
        return currentHead.next
    }
}