public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func middleNode(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
        return head;
    }
    var slow : ListNode? = head
    var fast : ListNode? = head
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil{
        return true
    }
    var secondHead : ListNode? = nil
    var fast : ListNode? = head
    var slow : ListNode? = head
    
    while (fast != nil) && ((fast?.next) != nil) {
        fast = fast?.next?.next
        if fast == nil {
            secondHead = slow
        } else if fast?.next == nil{
            secondHead = slow?.next
        }
        slow = slow?.next
    }
    
    let isOdd : Bool = fast != nil
    
    if isOdd {
        fast = slow?.next?.next
        slow?.next?.next = nil
    } else {
        fast = slow?.next
        slow?.next = nil
    }
    
    while  fast != nil {
        let p : ListNode? = fast?.next
        fast?.next = secondHead?.next
        secondHead?.next = fast
        fast = p
    }
    
    fast = secondHead?.next
    slow = head
    
    while fast != nil {
        if fast?.val != slow?.val {
            return false
        }
        fast = fast?.next
        slow = slow?.next
    }
    return true
}
func reverseList(_ head: ListNode?) -> ListNode? {
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
func hasCycle(_ head : ListNode?) -> Bool {
    if nil == head || nil == head?.next {
        return false
    }
    
    var slow : ListNode? = head
    var fast : ListNode? = head
    
    while nil != fast && nil != fast?.next {
        slow = slow?.next
        fast = fast?.next?.next
        if fast === slow {
            return true
        }
    }
    return false
}
func detectCycle(_ head : ListNode?) -> ListNode? {
    if nil == head || nil == head?.next {
        return nil
    }
    var slow : ListNode? = head
    var fast : ListNode? = head
    
    
    while nil != fast && nil != fast?.next {
        slow = slow?.next
        fast = fast?.next?.next
        if fast === slow {
            fast = head
            while fast !== slow {
                fast = fast?.next
                slow = slow?.next
            }
            return slow
        }
    }
    return nil
}
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let currentHead = ListNode(-1)
    currentHead.next = head
    var last : ListNode? = currentHead
    var next : ListNode? = head
    while nil != next {
        next?.val == val ? (last!.next = next?.next) : (last = next)
        next = next?.next
    }
    return currentHead.next
}

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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var fast : ListNode? = head
    var slow : ListNode? = head
    let currentHead : ListNode? = ListNode(-1)
    currentHead?.next = head
    var last = currentHead
    var i = 0;
    while i < n {
        fast = fast?.next
        i += 1
    }
    while nil != fast {
        fast = fast?.next
        slow = slow?.next
        last = last?.next
    }
    
    last?.next = slow?.next
    slow = nil
    return currentHead?.next
}
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if nil == l2 {
        return l1
    }
    if nil == l1 {
        return l2
    }
    let resultHead : ListNode = ListNode(0)
    var tail : ListNode? = resultHead
    var head1 = l1
    var head2 = l2
    while nil != head1 && nil != head2 {
        if head1!.val < head2!.val {
            tail?.next = head1
            head1 = head1?.next
        } else {
            tail?.next = head2
            head2 = head2?.next
        }
        tail = tail?.next
    }
    tail?.next = nil != head1 ? head1 : head2
    return resultHead.next
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if nil == l2 {
            return l1
        }
        if nil == l1 {
            return l2
        }
        let resultHead : ListNode = ListNode(0)
        var tail : ListNode? = resultHead
        var head1 = l1
        var head2 = l2
        while nil != head1 && nil != head2 {
            if head1!.val < head2!.val {
                tail?.next = head1
                head1 = head1?.next
            } else {
                tail?.next = head2
                head2 = head2?.next
            }
            tail = tail?.next
        }
        tail?.next = nil != head1 ? head1 : head2
        return resultHead.next
    }
    let listCount = lists.count
    if listCount == 0 {
        return nil
    } else if listCount == 1 {
        return lists[0]
    } else {
        var head : ListNode? = lists[0]
        for i in 1..<lists.count {
            head = mergeTwoLists1(head, lists[i])
        }
        return head
    }
}

func swapPairs(_ head: ListNode?) -> ListNode? {
    if nil == head ||  nil == head?.next {
        return head
    } else {
        let currentHead : ListNode = ListNode(-1)
        currentHead.next = head
        var last : ListNode? = currentHead
        var next : ListNode? = head?.next
        while nil != next {
            let temp : ListNode? = next?.next
            next?.next = last?.next
            last?.next?.next = temp
            last?.next = next
            last = last?.next?.next
            next = temp
            if nil != next {
                next = next?.next
            }
        }
        return currentHead.next
    }
}

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

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if nil == head || nil == head?.next {
        return head
    }
    var pre : ListNode? = head
    var p : ListNode? = head?.next
    while nil != p {
        if p?.val == pre?.val {
            p = p?.next
            pre?.next = p
        } else {
            p = p?.next
            pre = pre?.next
        }
    }
    return head
}

func deleteDuplicates_82(_ head: ListNode?) -> ListNode? {
    if nil == head || nil == head?.next {
        return head
    }
    let currentHead : ListNode? = ListNode(-1)
    currentHead?.next = head
    
    var pre : ListNode? = currentHead
    var cur : ListNode? = pre?.next
    var tar : ListNode? = cur?.next
    
    while nil != cur && nil != tar {
        if cur?.val == tar?.val {
            while nil != tar && tar?.val == cur?.val {
                var temp : ListNode? = tar
                tar = tar?.next
                temp = nil
            }
            pre?.next = tar
        } else {
            pre = cur
        }
        cur = tar
        if nil != tar {
            tar = tar?.next
        }
    }
    return currentHead?.next
}

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

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
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
    if m == n {
        return head
    }
    let currentHead : ListNode? = ListNode(-1)
    currentHead?.next = head
    var start : ListNode? = nil
    var end : ListNode? = nil
    var pre : ListNode? = currentHead
    var next : ListNode? = nil
    var current : ListNode? = head
    var i = 1
    
    while i <= n {
        if i == m {
            start = current
            print("start = \(String(describing: start?.val))")
        }
        if i < m {
            pre = pre?.next
        }
        if i == n {
            end = current
            next = current?.next
            end?.next = nil
            print("end = \(String(describing: end?.val))  next = \(String(describing: next?.val))")
        }
        if i < n {
            current = current?.next
        }
        i += 1
    }
    pre?.next = reverseList1(start)
    start?.next = next
    return currentHead?.next
}

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

func sortList(_ head: ListNode?) -> ListNode? {
    func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if nil == l2 {
            return l1
        }
        if nil == l1 {
            return l2
        }
        let resultHead : ListNode = ListNode(0)
        var tail : ListNode? = resultHead
        var head1 = l1
        var head2 = l2
        while nil != head1 && nil != head2 {
            if head1!.val < head2!.val {
                tail?.next = head1
                head1 = head1?.next
            } else {
                tail?.next = head2
                head2 = head2?.next
            }
            tail = tail?.next
        }
        tail?.next = nil != head1 ? head1 : head2
        return resultHead.next
    }
    
    func listSplit(_ head : ListNode?) -> ListNode? {
        if nil == head ||  nil == head?.next {
            return head
        }
        
        var fast : ListNode? = head
        var slow : ListNode? = head
        while nil != fast && nil != fast?.next?.next {
            fast = fast?.next
            if nil != fast {
                fast = fast?.next
            }
            if nil != fast {
                slow = slow?.next
            }
        }
        
        let temp = slow
        slow = slow?.next
        temp?.next = nil
        return slow
    }
    
    if nil == head || nil == head?.next{
        return head
    }
    
    var head1 : ListNode? = head
    var head2 : ListNode? = listSplit(head)
    head1 = sortList(head1)
    head2 = sortList(head2)
    return mergeTwoLists1(head1, head2)
}
func addTwoNumbers_Q445(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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


