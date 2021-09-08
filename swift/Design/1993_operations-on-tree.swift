// https://leetcode.com/problems/operations-on-tree/
class LockingTree {
    private var parent = [Int]()
    private var tree = [[Int]]()
    private var locked = [Int]()
    init(_ parent: [Int]) {
        self.parent = parent
        self.tree = [[Int]](repeating: [], count: parent.count)
        for i in 1..<parent.count {
            self.tree[parent[i]].append(i)
        }
        self.locked = [Int](repeating: -1, count: parent.count)
    }
    
    func lock(_ num: Int, _ user: Int) -> Bool {
        guard locked[num] == -1 else {
            return false
        }
        locked[num] = user
        return true
    }
    
    func unlock(_ num: Int, _ user: Int) -> Bool {
        guard locked[num] == user else {
            return false
        }
        locked[num] = -1
        return true
    }
    
    func upgrade(_ num: Int, _ user: Int) -> Bool {
        
        var node = num
        while -1 != node {
            guard -1 == locked[node] else {
                return false
            }
            node = parent[node]
        }
        
        var lockedchildren = [Int]()
        dfs(num, &lockedchildren)
        guard !lockedchildren.isEmpty else {
            return false
        }
        for (child) in lockedchildren {
            locked[child] = -1
        }
        locked[num] = user
        return true
    }
    
    private func dfs(_ node: Int, _ lockedChildren: inout [Int]) {
        if -1 != locked[node] {
            lockedChildren.append(node)
        }
        for child in tree[node] {
            dfs(child, &lockedChildren)
        }
    }
}
/**
 * Your LockingTree object will be instantiated and called as such:
 * let obj = LockingTree(parent)
 * let ret_1: Bool = obj.lock(num, user)
 * let ret_2: Bool = obj.unlock(num, user)
 * let ret_3: Bool = obj.upgrade(num, user)
 */