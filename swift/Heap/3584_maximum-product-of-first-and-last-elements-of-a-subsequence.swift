//https://leetcode.com/problems/maximum-product-of-first-and-last-elements-of-a-subsequence
import Collections

 struct MinPair: Comparable {
    static func < (lhs: MinPair, rhs: MinPair) -> Bool {
        return lhs.val < rhs.val
    }

    var val: Int
    var idx: Int
}
class Solution {
    func maximumProduct(_ nums: [Int], _ m: Int) -> Int {
        var ans = -1000000000000
        guard m > 1 else {
            for num in nums {
                ans = max(ans,num * num)
            }
            return ans
        }

        //min:最小值
        var minHeap = Heap<MinPair>()
        for i in 0..<nums.count {
            minHeap.insert( MinPair(val: nums[i], idx: i))

        }
        for i in 0..<nums.count {
            while let maxVal = minHeap.max, maxVal.idx < m + i - 1 {
                minHeap.popMax()
            }
            while let minVal = minHeap.min, minVal.idx < m + i - 1 {
                minHeap.popMin()
            }
            guard !minHeap.isEmpty else {break}
            ans = max(ans,nums[i] * minHeap.min!.val, nums[i] * minHeap.max!.val)
        }
        return ans
    }
}
