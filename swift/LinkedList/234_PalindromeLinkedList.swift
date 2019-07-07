public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q234_Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil{
            return true
        }
        var secondHead : ListNode? = nil
        var fast : ListNode? = head
        var slow : ListNode? = head
        
        while (fast != nil) && ((fast?.next) != nil) {
            fast = fast?.next?.next
            if fast == nil {
                secondHead = slow
            } else if fast?.next == nil{
                secondHead = slow?.next
            }
            slow = slow?.next
        }
        
        let isOdd : Bool = fast != nil
        
        if isOdd {
            fast = slow?.next?.next
            slow?.next?.next = nil
        } else {
            fast = slow?.next
            slow?.next = nil
        }
        
        while  fast != nil {
            let p : ListNode? = fast?.next
            fast?.next = secondHead?.next
            secondHead?.next = fast
            fast = p
        }
        
        fast = secondHead?.next
        slow = head
        
        while fast != nil {
            if fast?.val != slow?.val {
                return false
            }
            fast = fast?.next
            slow = slow?.next
        }
        return true
    }
}