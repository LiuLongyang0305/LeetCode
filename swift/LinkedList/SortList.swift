public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q148_Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if nil == l2 {
                return l1
            }
            if nil == l1 {
                return l2
            }
            let resultHead : ListNode = ListNode(0)
            var tail : ListNode? = resultHead
            var head1 = l1
            var head2 = l2
            while nil != head1 && nil != head2 {
                if head1!.val < head2!.val {
                    tail?.next = head1
                    head1 = head1?.next
                } else {
                    tail?.next = head2
                    head2 = head2?.next
                }
                tail = tail?.next
            }
            tail?.next = nil != head1 ? head1 : head2
            return resultHead.next
        }
        
        func listSplit(_ head : ListNode?) -> ListNode? {
            if nil == head ||  nil == head?.next {
                return head
            }
            
            var fast : ListNode? = head
            var slow : ListNode? = head
            while nil != fast && nil != fast?.next?.next {
                fast = fast?.next
                if nil != fast {
                    fast = fast?.next
                }
                if nil != fast {
                    slow = slow?.next
                }
            }
            
            let temp = slow
            slow = slow?.next
            temp?.next = nil
            return slow
        }
        
        if nil == head || nil == head?.next{
            return head
        }
        
        var head1 : ListNode? = head
        var head2 : ListNode? = listSplit(head)
        head1 = sortList(head1)
        head2 = sortList(head2)
        return mergeTwoLists1(head1, head2)
    }
}