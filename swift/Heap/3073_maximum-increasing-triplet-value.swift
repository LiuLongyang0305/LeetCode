    //https://leetcode.cn/problems/maximum-increasing-triplet-value/
struct IdxAndVal: Comparable {
    static func < (lhs: IdxAndVal, rhs: IdxAndVal) -> Bool {
        return lhs.val < rhs.val
    }

    var idx: Int
    var val:Int
}
    class Solution {
        private typealias Pair = (idx:Int,val:Int)
        func maximumTripletValue(_ nums: [Int]) -> Int {
            let M = nums.count
            guard M >= 3 else {return -1}
            var sortedList = [-1,nums[0],1_000_000_007]
            var heap = Heap<IdxAndVal>((0..<M).map({ IdxAndVal(idx: $0, val: nums[$0])}))
            var sb = Int.min / 2

            func binarySearchLastSmallerThan(_ target: Int) -> Pair {
                var l = 0
                var r = sortedList.count - 1
                while l < r {
                    let mid = (l + r + 1) >> 1
                    if sortedList[mid] >= target {
                        r = mid - 1
                    } else {
                        l = mid
                    }
                }
                return (l,sortedList[l])
            }

            for j in 1..<(M - 1) {
                while let top = heap.max, top.idx <= j {
                    let _ = heap.popMax()
                }
                let (idx,v) = binarySearchLastSmallerThan(nums[j])
                if let top = heap.max, top.val > nums[j] {
                    if idx !=  0 {
                        sb = max(sb,v + top.val - nums[j])
                    }
                }
                sortedList.insert(nums[j], at: idx + 1)
            }

            return sb
        }
    }
