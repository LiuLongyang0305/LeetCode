public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q143_Solution {
    func reorderList(_ head: ListNode?) {
        if nil ==  head || nil ==  head?.next || nil == head?.next?.next {
            return
        }
        let leftHead : ListNode? = ListNode(-1)
        let rightHead : ListNode? = ListNode(-1)
        leftHead?.next = head
        var fast : ListNode? = head
        var slow : ListNode? = head
        
        while nil != fast &&  nil != fast?.next {
            fast = fast?.next
            if nil != fast {
                fast = fast?.next
            }
            if nil != fast {
                slow = slow?.next
            }
        }
        
        rightHead?.next = slow?.next
        var temp : ListNode? = slow?.next?.next
        slow?.next?.next = nil
        slow?.next = nil
        while nil != temp {
            let p : ListNode?  = temp?.next
            temp?.next = rightHead?.next
            rightHead?.next = temp
            temp = p
        }
        slow = leftHead?.next
        fast = rightHead?.next
        var tail : ListNode? = leftHead
        var i : Int  = 0
        while nil != slow || nil != fast {
            if i % 2 == 0 {
                tail?.next = slow
                slow = slow?.next
            } else {
                tail?.next = fast
                fast = fast?.next
            }
            tail = tail?.next
            i += 1
        }
        
        tail?.next = nil == leftHead ? fast : slow
    }
}