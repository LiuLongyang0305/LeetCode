// https://leetcode-cn.com/problems/lru-cache-lcci/
 class LRUCache {
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
        // print(arr)
    }
 }
 

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */