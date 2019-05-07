public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q19_Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast : ListNode? = head
        var slow : ListNode? = head
        let currentHead : ListNode? = ListNode(-1)
        currentHead?.next = head
        var last = currentHead
        var i = 0;
        while i < n {
            fast = fast?.next
            i += 1
        }
        while nil != fast {
            fast = fast?.next
            slow = slow?.next
            last = last?.next
        }
        
        last?.next = slow?.next
        slow = nil
        return currentHead?.next
    }
}