public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q328_Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if nil == head || nil ==  head?.next || nil == head?.next?.next{
            return head
        }
        let oddHead : ListNode? = ListNode(-1)
        let evenHead : ListNode? = ListNode(-1)
        var oddTail : ListNode? = oddHead
        var evenTail : ListNode? = evenHead
        var temp : ListNode? = head
        var oddFlag : Bool = true
        while  nil !=  temp {
            let p : ListNode? = temp?.next
            temp?.next = nil
            if oddFlag {
                oddTail?.next = temp
                oddTail = temp
            } else {
                evenTail?.next = temp
                evenTail = temp
            }
            oddFlag = !oddFlag
            temp = p
        }
        oddTail?.next = evenHead?.next
        return oddHead?.next
    }
}