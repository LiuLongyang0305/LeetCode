public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q206_Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
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
}