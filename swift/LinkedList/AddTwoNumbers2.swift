public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q445_Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var value1 = [Int]()
        var value2 = [Int]()
        var values  = [Int]()
        var temp : ListNode? = l1
        while nil != temp {
            value1.append((temp?.val)!)
            temp = temp?.next
        }
        temp = l2
        while nil != temp {
            value2.append((temp?.val)!)
            temp = temp?.next
        }
        var carry : Int = 0
        while !value1.isEmpty || !value2.isEmpty {
            let x : Int = value1.isEmpty ? 0 : value1.popLast()!
            let y : Int = value2.isEmpty ? 0 : value2.popLast()!
            var temp = x + y + carry
            carry = temp / 10
            temp = temp % 10
            values.insert(temp, at: 0)
        }
        if carry > 0 {
            values.insert(carry, at: 0)
        }
        var resultHead : ListNode? = nil
        var tail : ListNode? = nil
        for num in values {
            let node = ListNode(num)
            if nil == resultHead {
                resultHead = node
                tail = node
            } else  {
                tail?.next = node
                tail = node
            }
        }
        return resultHead
    }
}