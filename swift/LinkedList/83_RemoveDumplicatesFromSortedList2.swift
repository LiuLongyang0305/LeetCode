public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q83_Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if nil == head || nil == head?.next {
            return head
        }
        var pre : ListNode? = head
        var p : ListNode? = head?.next
        while nil != p {
            if p?.val == pre?.val {
                p = p?.next
                pre?.next = p
            } else {
                p = p?.next
                pre = pre?.next
            }
        }
        return head
    }
}