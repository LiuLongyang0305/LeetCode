// https://leetcode.com/problems/minimum-operations-to-exceed-threshold-value-ii/
class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var  cnt = 0
        var heap = Heap<Int>.init(nums)
        while heap.count >= 2 && heap.min! <  k {
            cnt += 1
            let x = heap.popMin()!
            let y = heap.popMin()!
            heap.insert(2 * min(x,y) + max(x,y))
        }
        return cnt
    }
}