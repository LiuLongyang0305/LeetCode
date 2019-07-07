public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q82_Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if nil == head || nil == head?.next {
            return head
        }
        let currentHead : ListNode? = ListNode(-1)
        currentHead?.next = head
        
        var pre : ListNode? = currentHead
        var cur : ListNode? = pre?.next
        var tar : ListNode? = cur?.next
        
        while nil != cur && nil != tar {
            if cur?.val == tar?.val {
                while nil != tar && tar?.val == cur?.val {
                    var temp : ListNode? = tar
                    tar = tar?.next
                    temp = nil
                }
                pre?.next = tar
            } else {
                pre = cur
            }
            cur = tar
            if nil != tar {
                tar = tar?.next
            }
        }
        return currentHead?.next
    }
}