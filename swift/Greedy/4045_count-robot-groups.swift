// https://leetcode.cn/problems/count-robot-groups/
    class Solution {
        struct IdxAndSpeed: Comparable{
            static func < (lhs: Solution.IdxAndSpeed, rhs: Solution.IdxAndSpeed) -> Bool {
                if lhs.speed == rhs.speed {
                    return lhs.idx < rhs.idx
                }
                return lhs.speed < rhs.speed
            }

            var idx: Int
            var speed:Int
        }
        func countGroups(_ position: [Int], _ speed: [Int], _ distance: Int) -> Int {
            let M = position.count
            guard M > 1 else {return 1}
            var fa = [Int](repeating: 0, count: M)
            for i in 1..<M {
                if position[i] - position[i - 1] <= distance {
                    fa[i] = fa[i - 1]
                } else {
                    fa[i] = i
                }
            }

            var finalSed = [Int]()
            for i in 1..<M {
                if fa[i] != fa[i - 1] {
                    finalSed.append(speed[i - 1])
                }
            }
            // print(fa)
            finalSed.append(speed[M - 1])
            // print(finalSed)
            return solve(finalSed)
        }
        private func solve(_ arr:[Int]) -> Int {
            var heap = Heap<IdxAndSpeed>()
            for (i,s) in arr.enumerated() {
                heap.insert(IdxAndSpeed(idx: i, speed: s))
            }
            var idxLimit = -1
            var cnt = 0
            while let top = heap.min {
                idxLimit = top.idx
                cnt += 1
                while let top = heap.min,top.idx <= idxLimit {
                    let _ = heap.popMin()
                }
            }
            return cnt
        }
    }
