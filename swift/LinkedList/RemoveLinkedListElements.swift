public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q203_Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let currentHead = ListNode(-1)
        currentHead.next = head
        var last : ListNode? = currentHead
        var next : ListNode? = head
        while nil != next {
            next?.val == val ? (last!.next = next?.next) : (last = next)
            next = next?.next
        }
        return currentHead.next
    }
}