public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q817_Solution {
    func numComponents(_ head: ListNode?, _ G: [Int]) -> Int {
        if nil == head {
            return 0
        }
        var count : Int = 0
        var temp : ListNode? = head
        var isCompoments = false
        let set = Set<Int>(G)
        while nil != temp {
            let targetValue : Int = (temp?.val)!
            if set.contains(targetValue) {
                if !isCompoments {
                    isCompoments = true
                    count += 1
                }
            } else {
                isCompoments = false
            }
            temp  = temp?.next
        }
        return count
    }
}