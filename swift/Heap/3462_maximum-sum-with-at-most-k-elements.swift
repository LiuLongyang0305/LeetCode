
// https://leetcode.com/problems/maximum-sum-with-at-most-k-elements/
class Solution {
    func maxSum(_ grid: [[Int]], _ limits: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>()
        var sum = 0
        let M = grid.count
        for i in 0..<M {
            var curHeap = Heap<Int>.init(grid[i])
            for _ in 0..<limits[i] {
                let t = curHeap.popMax() ?? 0
                sum += t
                heap.insert(t)
                if heap.count > k {
                    sum -= (heap.popMin() ?? 0)
                }
            }
        }
        return sum
    }
}