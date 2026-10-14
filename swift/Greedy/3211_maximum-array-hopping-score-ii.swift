    //https://leetcode.cn/problems/maximum-array-hopping-score-ii/
    class Solution {
        struct ValAndIdx: Comparable {
            static func < (lhs: Solution.ValAndIdx, rhs: Solution.ValAndIdx) -> Bool {
                if lhs.val == rhs.val {
                    return lhs.idx < rhs.idx
                }
                return lhs.val < rhs.val
            }
            
            var idx: Int
            var val: Int

        }
        func maxScore(_ nums: [Int]) -> Int {
            var heap = Heap<ValAndIdx>()
            for (i,v) in nums.enumerated() {
                heap.insert(ValAndIdx(idx: i, val: v))
            }
            let target = nums.count - 1
            var cur = 0
            var score = 0
            while cur != target {
                while let top = heap.max, top.idx <= cur {
                    let _ = heap.popMax()
                }
                if let top = heap.max {
                    score += (top.idx - cur) * top.val
                    cur = top.idx
                }
            }
            return score
        }
    }
