    // https://leetcode.cn/problems/maximum-total-sum-with-threshold-constraints/
    class Solution {
        private struct IdxAndLimit:Comparable {
            static func < (lhs: Solution.IdxAndLimit, rhs: Solution.IdxAndLimit) -> Bool {
                return lhs.limit < rhs.limit
            }
            
            var idx: Int
            var limit:Int
        }
        func maxSum(_ nums: [Int], _ threshold: [Int]) -> Int {
            var limitHeap = Heap<IdxAndLimit>()
            for (i,l) in threshold.enumerated() {
                limitHeap.insert(IdxAndLimit(idx: i, limit: l))
            }
            var numHeap = Heap<Int>()
            var ans = 0

            var step = 1
            while true {
                while let top = limitHeap.min, top.limit <= step {
                    numHeap.insert(nums[top.idx])
                    let _ = limitHeap.popMin()
                }
                guard let top = numHeap.max else {
                    break
                }
                ans += top
                let _ = numHeap.popMax()
                step += 1
            }

            return ans
        }
    }
