
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q24_Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if nil == head ||  nil == head?.next {
            return head
        } else {
            let currentHead : ListNode = ListNode(-1)
            currentHead.next = head
            var last : ListNode? = currentHead
            var next : ListNode? = head?.next
            while nil != next {
                let temp : ListNode? = next?.next
                next?.next = last?.next
                last?.next?.next = temp
                last?.next = next
                last = last?.next?.next
                next = temp
                if nil != next {
                    next = next?.next
                }
            }
            return currentHead.next
        }
    }
}