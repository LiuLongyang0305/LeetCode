// https://leetcode.com/problems/optimal-account-balancing/
class Solution {
    struct State: Hashable, CustomStringConvertible {
        var description: String {
            return "\(moneyToGet)  \(moneyToReturn)"
        }
        
        var moneyToGet: [Int]
        var moneyToReturn: [Int]
    }
    private var memo = [State:Int]()
    func minTransfers(_ transactions: [[Int]]) -> Int {
        var map = [Int:Int]()
        for transaction in transactions {
            map[transaction[0],default: 0 ] -= transaction[2]
            map[transaction[1],default: 0 ] += transaction[2]
        }
        var s = State(moneyToGet: [], moneyToReturn: [])
        var ans = 0
        for (_,val) in map {
            if val > 0 {
                if s.moneyToGet.contains(-val) {
                    ans += 1
                    if let idx = s.moneyToGet.firstIndex(of: -val) {
                        s.moneyToGet.remove(at: idx)
                    }
                } else {
                    s.moneyToReturn.append(val)
                }
                
            } else if val < 0 {
                if s.moneyToReturn.contains(-val) {
                    ans += 1
                    if let idx = s.moneyToReturn.firstIndex(of: -val) {
                        s.moneyToReturn.remove(at: idx)
                    }
                } else {
                    s.moneyToGet.append(val)
                }
                
            }
        }
        guard !s.moneyToGet.isEmpty else {
            return ans
        }
        
        self.memo = [:]
        return ans + helper(s)
    }
    
    private func helper(_ lastState: State) -> Int {
        
        guard nil == memo[lastState] else {
            return memo[lastState]!
        }
        
        let moneyToGet = lastState.moneyToGet
        let moneyToReturn = lastState.moneyToReturn
        
        guard moneyToReturn.count != 1 && moneyToGet.count != 1 else {
            return moneyToGet.count == 1 ? moneyToReturn.count : moneyToGet.count
        }
        
//        guard !moneyToGet.isEmpty else {
//            return 0
//        }
        var ans = Int.max
        for i in 0..<moneyToReturn.count {
            if moneyToReturn[i] > 0 {
                for j in 0..<moneyToGet.count {
                    if moneyToGet[j] < 0 {
                        //处理
                        var t1 = moneyToReturn
                        var t2 = moneyToGet
                        
                        if moneyToReturn[i] == -moneyToGet[j] {
                            t1.remove(at: i)
                            t2.remove(at: j)
                        } else if moneyToReturn[i] > -moneyToGet[j] {
                            t1[i] += t2[j]
                            t2.remove(at: j)
                        } else {
                            t2[j] += t1[i]
                            t1.remove(at: i)
                            
                        }
                        ans = min(ans,1 + helper(State(moneyToGet: t2, moneyToReturn: t1)))
                    }
                }
            }
        }
        memo[lastState] = ans
        return ans
    }
}