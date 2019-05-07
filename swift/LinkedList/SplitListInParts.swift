public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Q725_Solution {
    func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        var result  = Array<ListNode?>(repeating: nil, count: k)
        if nil == root {
            return result
        }
        var length = 0
        var temp : ListNode? = root
        while nil != temp {
            length += 1
            temp = temp?.next
        }
        if k >= length {
            temp = root
            var i = 0
            while nil != temp {
                let p = temp?.next
                temp?.next = nil
                result[i] = temp
                temp = p
                i += 1
            }
            return result
        }
        
        let average = length / k
        let mod =  length % k
        var currentHead : ListNode? = root
        for i in 0..<k {
            temp = currentHead
            let targetNodes = i < mod ? (average + 1) : average
            print("targer = \(targetNodes)")
            var j : Int = 0
            while j < targetNodes  {
                temp = temp?.next
                j += 1
            }
            result[i] = currentHead
            currentHead = temp?.next
            temp?.next = nil
            
        }
        return result
    }
}