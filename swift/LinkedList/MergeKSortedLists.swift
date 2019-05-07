public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q23_Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
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
        let listCount = lists.count
        if listCount == 0 {
            return nil
        } else if listCount == 1 {
            return lists[0]
        } else {
            var head : ListNode? = lists[0]
            for i in 1..<lists.count {
                head = mergeTwoLists1(head, lists[i])
            }
            return head
        }
    }
}