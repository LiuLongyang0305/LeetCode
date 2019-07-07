public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q25_Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        func reverseList1(_ head: ListNode?) -> ListNode? {
            if nil == head || nil == head?.next {
                return head
            }
            var node = head?.next
            var currentHead : ListNode? = head
            currentHead?.next = nil
            
            while nil != node {
                let p : ListNode? = node?.next
                node?.next = currentHead
                currentHead = node
                node = p
            }
            return currentHead
        }
        
        if nil == head || nil == head?.next || k == 1 {
            return head
        } else {
            var result : ListNode? = nil
            var tail : ListNode? = nil
            var nextHead : ListNode? = head
            var node : ListNode? = nil
            var lastHead : ListNode? = nil
            
            while true {
                var i = 0
                node = nextHead
                
                while i < k && nil != node {
                    i += 1
                    if i != k {
                        node = node?.next
                    }
                }
                
                if i < k && nil == node && nil == result {
                    return head
                }
                if i == k {
                    
                    lastHead = nextHead
                    nextHead = node?.next
                    node?.next = nil
                    
                    let temp = reverseList1(lastHead)
                    if nil == result {
                        result = temp
                    }
                    if nil != tail {
                        tail?.next = temp
                    }
                    tail = lastHead
                } else {
                    tail?.next = nextHead
                    break
                }
            }
            return result
        }
    }
}