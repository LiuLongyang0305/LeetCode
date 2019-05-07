public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q147_Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        if nil == head || nil == head?.next {
            return head
        }
        let resultHead : ListNode? = ListNode(-1)
        resultHead?.next = head
        var temp : ListNode? = head?.next
        head?.next = nil
        var tail : ListNode? = head
        while nil != temp {
            let p : ListNode? = temp?.next
            let target : Int = (temp?.val)!
            if target < (tail?.val)! {
                if target < (resultHead?.next?.val)! {
                    temp?.next = resultHead?.next
                    resultHead?.next = temp
                } else {
                    var q : ListNode? = resultHead?.next
                    while nil != q?.next {
                        if (q?.val)! <= target && (q?.next?.val)! > target {
                            temp?.next = q?.next
                            q?.next = temp
                            break
                        }
                        q = q?.next
                    }
                }
            } else {
                tail?.next = temp
                temp?.next = nil
                tail = temp
            }
            temp = p
        }
        return resultHead?.next
    }
}