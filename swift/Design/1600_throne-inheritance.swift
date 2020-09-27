// https://leetcode.com/problems/throne-inheritance/
class ThroneInheritance {
    private var kingName: String
    private var children = [String:[String]]()
    private var parent = [String:String]()
    private var dead = Set<String>()
    private var currentOrder = [String]()
    private var isInCurrentOrderSet = [String:Bool]()
    private var changed = true
    init(_ kingName: String) {
        self.kingName = kingName
    }
    
    func birth(_ parentName: String, _ childName: String) {
        children[parentName, default: [] ].append(childName)
        parent[childName] = parentName
        changed = true
    }
    
    func death(_ name: String) {
        dead.insert(name)
    }
    
    func getInheritanceOrder() -> [String] {
        if changed {
            self.currentOrder = [kingName]
            self.isInCurrentOrderSet = [:]
            self.isInCurrentOrderSet[kingName] = true
            
            while let next = succcessor(currentOrder.last!, currentOrder) {
                self.currentOrder.append(next)
                self.isInCurrentOrderSet[next] = true
            }
            changed = false
        }
        var ans = [String]()
        for n in self.currentOrder {
            if !dead.contains(n) {
                ans.append(n)
            }
        }
        return ans
    }
    private func succcessor(_ x: String, _ curOrder: [String]) -> String? {
        
        if let next = checkIsAllInCurrentOrder(x) {
            return next
        }
        return x == self.kingName ? nil : succcessor(parent[x]!, curOrder)
    }
    
    private func checkIsAllInCurrentOrder(_ x: String) -> String? {
        guard let nextGeneration =  children[x] else {
            return nil
        }
        for next in nextGeneration {
            if nil == isInCurrentOrderSet[next] {
                return next
            }
        }
        return nil
    }
}
/**
 * Your ThroneInheritance object will be instantiated and called as such:
 * let obj = ThroneInheritance(kingName)
 * obj.birth(parentName, childName)
 * obj.death(name)
 * let ret_3: [String] = obj.getInheritanceOrder()
 */