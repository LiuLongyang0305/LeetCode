 //https://leetcode.com/problems/lru-cache/
 class LRUCache {
    private class LinkedListNode: Equatable {
        var key: Int
        var val: Int
        var prev: LinkedListNode? = nil
        var next: LinkedListNode? = nil
        init(key: Int,val: Int) {
            self.key = key
            self.val =  val
        }
        static func == (lhs: LRUCache.LinkedListNode, rhs: LRUCache.LinkedListNode) -> Bool {
            return lhs.key == rhs.key && lhs.val == rhs.val
        }
        var toString: String {
            return "node: (key,val)  = (\(key),\(val))"
        }
    }
    private class DeLinkedList {
        private let capacity: Int
        private var head = LinkedListNode(key: Int.min, val: Int.min)
        private var tail = LinkedListNode(key: Int.min, val: Int.min)
        private var size = 0
        init(_ capacity: Int) {
            self.capacity = capacity
            head.next = tail
            tail.prev = head
        }
        public func get(key: Int) {
            if let k =  head.next?.key ,k == key {
                return
            }
            guard size > 1 else {
                return
            }
            var current = head.next
            while let k = current?.key, k != key {
                current = current?.next
            }
            removeNode(current)
            insertAtHead(current)
        }
        public func put(node: LinkedListNode,  alreadyContains: Bool, _ callback: (_ node: LinkedListNode?) -> ()) {
            if alreadyContains {
                get(key: node.key)
                head.next?.val = node.val
            }  else {
                insertAtHead(node)
                if size > capacity {
                    callback(tail.prev)
                    removeNode(tail.prev)
                }
            }
        }
        private func insertAtHead(_ node: LinkedListNode?) {
            node?.prev = head
            node?.next = head.next
            head.next = node
            node?.next?.prev = node
            size += 1
        }
        private func removeNode(_ node: LinkedListNode?) {
            guard head.next !=  tail else {
                return
            }
            node?.prev?.next = node?.next
            node?.next?.prev = node?.prev
            size -= 1
        }
        
        public func display() {
            var str = ""
            var current = head.next
            
            while current?.next != nil {
                str += "\(current?.toString ?? "")  "
                current = current?.next
            }
            print(str)
        }
        
    }
    private var map: [Int:Int] = [Int:Int]()
    private var list: DeLinkedList
    init(_ capacity: Int) {
        list = DeLinkedList(capacity)
    }
    
    func get(_ key: Int) -> Int {
        if let val = map[key] {
            //调整位置
            list.get(key: key)
            return val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        let alreadyContains = nil !=  map[key]
        map.updateValue(value, forKey: key)
        list.put(node: LRUCache.LinkedListNode(key: key, val: value), alreadyContains: alreadyContains) { (node) in
            if let n = node {
                map.removeValue(forKey: n.key)
            }
        }
    }
 }
 
 class LRUCache1 {
    typealias Node = (key:Int,val: Int)
    private var arr: [Node]
    private let capacity: Int
    private var map = [Int:Int]()
    init(_ capacity: Int) {
        arr = Array<Node>()
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let val = map[key] {
            let index = arr.firstIndex {$0.key == key}!
            let node = arr[index]
            arr.remove(at: index)
            arr.insert(node, at: 0)
            return val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        let alreadyExist  =  nil != map[key]
        map.updateValue(value, forKey: key)
        if alreadyExist {
            get(key)
            arr[0].val = value
        } else {
            if arr.count == capacity {
                map.removeValue(forKey: arr.last!.key)
                arr.removeLast()
            }
            arr.insert((key,value), at: 0)
        }
    }
 }
 
