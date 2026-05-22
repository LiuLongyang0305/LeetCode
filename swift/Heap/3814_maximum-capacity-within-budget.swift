    //https://leetcode.cn/problems/maximum-capacity-within-budget/
    class Solution {
        private typealias Pair = (cost: Int,cap:Int,idx:Int)
        private struct Machine:Comparable {
            static func < (lhs: Solution.Machine, rhs: Solution.Machine) -> Bool {
                lhs.cap > rhs.cap
            }

            var cost:Int
            var cap:Int
            var idx: Int
        }
        func maxCapacity(_ costs: [Int], _ capacity: [Int], _ budget: Int) -> Int {
            let N =  costs.count
            let pairs:[Pair] = (0..<N).map { (costs[$0],capacity[$0],$0)}.sorted { p1, p2 in
                if p1.cost == p2.cost {
                    return p1.cap > p2.cap
                }
                return p1.cost < p2.cost
            }

            var heap = Heap<Machine>()
            for i in 0..<N {
                heap.insert(Machine(cost: costs[i], cap: capacity[i],idx:i))
            }
            var removeSet = Set<Int>()
            var sb = 0

            for i in 0..<N {
                removeSet.insert(pairs[i].idx)
                guard pairs[i].cost < budget else {
                    break
                }
                sb = max(sb,pairs[i].cap)
                let remian = budget - pairs[i].cost
                while let top = heap.min, top.cost >= remian || removeSet.contains(top.idx) {
                    let _ = heap.popMin()
                }
                if let top = heap.min {
                    sb = max(sb,pairs[i].cap + top.cap)
                }
            }
            return sb
        }
    }
