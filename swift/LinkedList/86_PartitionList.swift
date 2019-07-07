public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q86_Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if nil == head || nil == head?.next {
            return head
        }
        
        let lessHead : ListNode = ListNode(-1)
        let moreHead : ListNode = ListNode(-1)
        
        var lessTail : ListNode? = nil
        var moreTail : ListNode? = nil
        
        var temp : ListNode? = head
        
        while nil != temp {
            if (temp?.val)! < x {
                nil == lessTail ? (lessHead.next = temp) : (lessTail?.next = temp)
                lessTail = temp
            } else {
                nil == moreTail ? (moreHead.next = temp) : (moreTail?.next = temp)
                moreTail = temp
            }
            temp = temp?.next
        }
        if nil == lessTail {
            moreTail?.next = nil
            return moreHead.next
        } else if nil == moreTail {
            lessTail?.next = nil
            return lessHead.next
        } else {
            moreTail?.next = nil
            lessTail?.next = moreHead.next
            return lessHead.next
        }
    }
}