    // https://leetcode.cn/problems/find-time-required-to-eliminate-bacterial-strains/
    class Solution {
        func minEliminationTime(_ timeReq: [Int], _ splitTime: Int) -> Int {
            var heap = Heap<Int>(timeReq)
            while heap.count > 1 {
                let _ = heap.popMin()!
                let y = heap.popMin()!
                heap.insert(y + splitTime)
            }
            return heap.min!
        }
    }
