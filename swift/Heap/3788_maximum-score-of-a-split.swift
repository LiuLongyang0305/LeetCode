    //https://leetcode.com/problems/maximum-score-of-a-split/
struct Pair: Comparable {
    static func < (lhs: Pair, rhs: Pair) -> Bool {
        if lhs.val == rhs.val {
            return lhs.idx < rhs.idx
        }
        return lhs.val < rhs.val
    }

    var val: Int
    var idx: Int
}
    class Solution {
        func maximumScore(_ nums: [Int]) -> Int {
            var sb = Int.min / 2
            var heap = Heap<Pair>()
            let N = nums.count
            for i in 0..<N {
                heap.insert(Pair(val: nums[i], idx: i))
            }
            var prefixSum = 0
            for i in 0..<(N - 1) {
                prefixSum += nums[i]
                while  let min = heap.min, min.idx <= i {
                    heap.removeMin()
                }
                sb = max(sb,prefixSum - heap.min!.val)
            }
            return sb
        }
    }
    
