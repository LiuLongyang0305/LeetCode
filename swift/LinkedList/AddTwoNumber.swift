public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q2_Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var resultHead : ListNode? = nil
        var currentNode : ListNode? = resultHead
        var head1 = l1
        var head2 = l2
        var carry : Int = 0
        while nil != head1 || nil != head2 {
            var x = 0
            var y = 0
            if nil != head1 {
                y = (head1?.val)!
                head1 = head1?.next
            }
            if nil != head2 {
                x  = (head2?.val)!
                head2 = head2?.next
            }
            
            let temp = x + y + carry
            if nil == currentNode{
                currentNode = ListNode(temp % 10)
                resultHead = currentNode
            } else {
                currentNode?.next = ListNode(temp % 10)
                currentNode = currentNode?.next
            }
            carry = temp / 10
        }
        if 0 != carry {
            currentNode?.next = ListNode(carry)
        }
        
        return resultHead
    }
}