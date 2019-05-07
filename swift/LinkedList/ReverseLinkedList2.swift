public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q92_Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        func reverseList1(_ head: ListNode?) -> ListNode? {
            if nil == head || nil == head?.next {
                return head
            }
            var node = head?.next
            var currentHead : ListNode? = head
            currentHead?.next = nil
            while nil != node {
                let p : ListNode? = node?.next
                node?.next = currentHead
                currentHead = node
                node = p
            }
            return currentHead
        }
        if m == n {
            return head
        }
        let currentHead : ListNode? = ListNode(-1)
        currentHead?.next = head
        var start : ListNode? = nil
        var end : ListNode? = nil
        var pre : ListNode? = currentHead
        var next : ListNode? = nil
        var current : ListNode? = head
        var i = 1
        
        while i <= n {
            if i == m {
                start = current
                print("start = \(String(describing: start?.val))")
            }
            if i < m {
                pre = pre?.next
            }
            if i == n {
                end = current
                next = current?.next
                end?.next = nil
                print("end = \(String(describing: end?.val))  next = \(String(describing: next?.val))")
            }
            if i < n {
                current = current?.next
            }
            i += 1
        }
        pre?.next = reverseList1(start)
        start?.next = next
        return currentHead?.next
    }
}