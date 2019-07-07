public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q61_Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        func getListLength(_ head : ListNode?) -> Int{
            var length : Int = 0
            var temp : ListNode? = head
            while nil != temp {
                length += 1
                temp = temp?.next
            }
            return length
        }
        if 0 == k || nil == head{
            return head
        }
        let length = getListLength(head)
        var times : Int = k % length
        if 0 == times{
            return head
        } else {
            times = length - times
            var last : ListNode? = nil
            var next : ListNode? = head
            var result : ListNode? = nil
            var i : Int = 0
            while i < times {
                if i == times - 1 {
                    last = next
                }
                next = next?.next
                i += 1
            }
            for i in 1...times {
                next = next?.next
                if i == times - 1 {
                    last = next
                }
            }
            last?.next = nil
            result = next
            while nil != next?.next  {
                next = next?.next
            }
            next?.next = head
            return result
        }
    }