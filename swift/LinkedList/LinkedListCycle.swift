public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q141_Solution {
    func hasCycle(_ head : ListNode?) -> Bool {
        if nil == head || nil == head?.next {
            return false
        }
        
        var slow : ListNode? = head
        var fast : ListNode? = head
        
        while nil != fast && nil != fast?.next {
            slow = slow?.next
            fast = fast?.next?.next
            if fast === slow {
                return true
            }
        }
        return false
    }
}