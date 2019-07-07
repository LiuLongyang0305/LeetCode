public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q142_Solution{
    func detectCycle(_ head : ListNode?) -> ListNode? {
        if nil == head || nil == head?.next {
            return nil
        }
        var slow : ListNode? = head
        var fast : ListNode? = head
        
        
        while nil != fast && nil != fast?.next {
            slow = slow?.next
            fast = fast?.next?.next
            if fast === slow {
                fast = head
                while fast !== slow {
                    fast = fast?.next
                    slow = slow?.next
                }
                return slow
            }
        }
        return nil
    }
}
