public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class MyLinkedList {
    public var head : ListNode?
    public var tail : ListNode?
    public var length : Int
    /** Initialize your data structure here. */
    init() {
        self.head = nil
        self.tail = nil
        self.length = 0
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index < 0 || index > length - 1 {
            return -1
        }
        
        var temp = head
        var i : Int = 0
        while temp != nil {
            if index == i {
                return (temp?.val)!
            }
            temp = temp?.next
            i += 1
        }
        return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let currentHead = ListNode(val)
        if length == 0 {
            tail = currentHead
        } else {
            currentHead.next = head
        }
        head = currentHead
        length += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let currentTail = ListNode(val)
        if length == 0 {
            head = currentTail
        } else {
            tail?.next = currentTail
        }
        tail = currentTail
        length += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index < 0 || index > length {
            return
        }
        if index == 0 {
            addAtHead(val)
        } else if index == length {
            addAtTail(val)
        } else {
            var i : Int = 0
            var temp : ListNode? = head
            while  nil !=  temp {
                if i == index - 1 {
                    let node = ListNode(val)
                    let p : ListNode? = temp?.next
                    temp?.next = node
                    node.next = p
                    length += 1
                    break
                }
                i += 1
                temp = temp?.next
            }
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index < 0 || index > length {
            return
        }
        var temp : ListNode? = head
        if length == 1 {
            head = nil
            tail = nil
        } else {
            if index == 0 {
                head = temp?.next
            } else {
                var i : Int = 0
                while nil != temp {
                    if i == index - 1 {
                        let toDelete : ListNode? = temp?.next
                        temp?.next = toDelete?.next
                        if nil == temp?.next {
                            tail = temp
                        }
                        temp = toDelete
                        break
                    }
                    i += 1
                    temp = temp?.next
                }
            }
        }
        temp = nil
        length -= 1
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */