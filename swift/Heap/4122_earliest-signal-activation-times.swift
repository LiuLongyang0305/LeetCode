    // https://leetcode.cn/problems/earliest-signal-activation-times/

    class Solution {
        private typealias NodeAndDelay = (node:Int,delay:Int)
        struct ActiveInfo: Comparable {
            static func < (lhs: Solution.ActiveInfo, rhs: Solution.ActiveInfo) -> Bool {
                return lhs.time < rhs.time
            }
            
            var node: Int
            var time:Int
        }
        func earliestActivationTimes(_ n: Int, _ edges: [[Int]], _ requiredSignals: [Int]) -> [Int] {
            var tree = [[NodeAndDelay]](repeating: [], count: n)
            for e in edges {
                tree[e[0]].append((e[1],e[2]))
            }
            var ans = [Int](repeating: -1, count: n)
            var heap = Heap<ActiveInfo>()
            heap.insert(ActiveInfo(node: 0, time: 0))
            var reminRequiredSignals = requiredSignals
            reminRequiredSignals[0] = 1

            while let min = heap.popMin() {
                let (node,time) = (min.node,min.time)
                reminRequiredSignals[node] -= 1
                if reminRequiredSignals[node] != 0 {continue}
                ans[node] = time
                for (next,delay) in tree[node] {
                    heap.insert(ActiveInfo(node: next, time: time + delay))
                }
            }
            return ans
        }
    }
