    //https://leetcode.cn/problems/maximize-profit-from-task-assignment/
    class Solution {
        private let ANY = 10000000
        func maxProfit(_ workers: [Int], _ tasks: [[Int]]) -> Int {
            var skillCounter = [Int:Int]()
            for s in workers {
                skillCounter[s,default: 0] += 1
            }
            var maxProfitsNoMatched = 0
            var skillToProfits = [Int:Heap<Int>]()
            for t in tasks {
                let (s,p) = (t[0],t[1])
                if let _ = skillCounter[s] {
                    skillToProfits[s,default: Heap<Int>()].insert(p)
                } else {
                    maxProfitsNoMatched = max(maxProfitsNoMatched,p)
                }
            }

            var ans = 0
            for (s,cnt) in skillCounter {
                if var heap = skillToProfits[s] {
                    var t = 0
                    while t < cnt {
                        ans += (heap.popMax() ?? 0)
                        t += 1
                    }
                    if let p = heap.max {
                        maxProfitsNoMatched = max(maxProfitsNoMatched,p)
                    }
                }
            }
            return ans + maxProfitsNoMatched
        }
    }
