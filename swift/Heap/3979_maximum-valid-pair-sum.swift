    //https://leetcode.cn/problems/maximum-valid-pair-sum/
struct IdxToVal: Comparable {
    static func < (lhs: IdxToVal, rhs: IdxToVal) -> Bool {
        return lhs.val == rhs.val ? (lhs.idx < rhs.idx) : (lhs.val < rhs.val )
    }

    var val: Int
    var idx: Int
}
    class Solution {
        func maxValidPairSum(_ nums: [Int], _ k: Int) -> Int {
            var heap = Heap((0..<nums.count).map({ IdxToVal(val: nums[$0], idx: $0)}))
            var sb = 0
            for i in 0..<nums.count {
                while let mx = heap.max, mx.idx < k + i {
                    let _ = heap.popMax()
                }
                guard !heap.isEmpty else {break}
                sb = max(sb,nums[i] + heap.max!.val)
            }
            return sb
        }
    }
