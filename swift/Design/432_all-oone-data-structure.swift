//  https://leetcode.com/problems/all-oone-data-structure/
class AllOne {

    
    private class Node {
        var left: Node? = nil
        var right: Node? = nil
        var strs: Set<String> = []
        var val: Int
        init(_ v: Int) {
            val = v
        }
    }
    
    
    private var left = Node(Int.min)
    private var right = Node(Int.max)
    private var hash = [String:Node?]()
    init() {
        left.right = right
        right.left = left
    }
    
    private func addToRight(_ node: Node?, _ key: String,_ val: Int) -> Node? {
        if (node?.right?.val ?? Int.max) == val {
            node?.right?.strs.insert(key)
        } else {
            let t = Node(val)
            t.strs.insert(key)
            t.right = node?.right
            node?.right?.left = t
            node?.right = t
            t.left = node
        }
        return node?.right
    }
    
    
    private func addToLeft(_ node: Node?, _ key: String,_ val: Int) -> Node? {
        if (node?.left?.val ?? Int.min) == val {
            node?.left?.strs.insert(key)
        } else {
            let t = Node(val)
            t.strs.insert(key)
            t.left = node?.left
            node?.left?.right = t
            node?.left = t
            t.right = node
        }
        return node?.left
    }
    

    
    
    private func remove(_ node: Node?) {
        node?.left?.right = node?.right
        node?.right?.left = node?.left
    }
    
    func inc(_ key: String) {
        guard let t = hash[key] else {
            hash[key] = addToRight(left, key, 1)
            return
        }
        t?.strs.remove(key)
        hash[key] = addToRight(t, key, (t?.val ?? 0) + 1)
        if let f = t?.strs.isEmpty, f {
            remove(t)
        }
    }
    
    func dec(_ key: String) {
        guard let t = hash[key] else {return}
        t?.strs.remove(key)
        let cnt = t?.val ?? 0
        if cnt > 1 {
            hash[key] = addToLeft(t, key, cnt - 1)
        } else {
            hash.removeValue(forKey: key)
        }
        if let f = t?.strs.isEmpty, f {
            remove(t)
        }
    }
    
    func getMaxKey() -> String {
        if right.left === left {
            return ""
        }
        return right.left?.strs.first ?? ""
    }
    
    func getMinKey() -> String {
        if left.right === right {
            return ""
        }
        return left.right?.strs.first ?? ""
    }
}

/**
 * Your AllOne object will be instantiated and called as such:
 * let obj = AllOne()
 * obj.inc(key)
 * obj.dec(key)
 * let ret_3: String = obj.getMaxKey()
 * let ret_4: String = obj.getMinKey()
 */