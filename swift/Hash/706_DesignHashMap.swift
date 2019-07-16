//https://leetcode.com/problems/design-hashmap/
class MyHashMap {
    
    var myHashMap = Dictionary<Int,Int>()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        myHashMap[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        if  let val = myHashMap[key] {
            return val
        }
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        myHashMap.removeValue(forKey: key)
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
