// https://leetcode.com/problems/fancy-sequence/
class Fancy {
    private typealias Ope = (lastIndex:Int,action: Int,val:Int)
    private var values = [Int]()
    private var opes = [Ope]()
    private let MOD = 1_000_000_007
    init() {

    }
    
    func append(_ val: Int) {
        self.values.append(val)
    }
    private func updateOpes(_ ope: Ope) {
        guard let lastOpe = opes.last else {
            self.opes.append(ope)
            return
        }
        let N = self.opes.count
        if lastOpe.lastIndex == ope.lastIndex && lastOpe.action == ope.action{
            self.opes[N - 1].val = (lastOpe.action == 1 ? (lastOpe.val + ope.val) : (lastOpe.val * ope.val)) % MOD
        } else {
            self.opes.append(ope)
        }
    }
    func addAll(_ inc: Int) {
        updateOpes((values.count - 1,1,inc))
    }
    
    func multAll(_ m: Int) {
        updateOpes((values.count - 1,2,m))
    }
    
    func getIndex(_ idx: Int) -> Int {
        guard idx < values.count && idx >= 0 else {
            return -1
        }
        var ans = values[idx]
        for ope in opes {
            if ope.lastIndex >= idx {
                if 1 == ope.action {
                    ans += ope.val
                } else {
                    ans *= ope.val
                }
                if ans >= self.MOD {
                    ans %= self.MOD
                }
            }
        }
        return ans
    }
}


/**
 * Your Fancy object will be instantiated and called as such:
 * let obj = Fancy()
 * obj.append(val)
 * obj.addAll(inc)
 * obj.multAll(m)
 * let ret_4: Int = obj.getIndex(idx)
 */