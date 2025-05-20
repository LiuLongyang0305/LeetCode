//https://leetcode.com/problems/zero-array-transformation-iii/description/
class Solution {
    func maxRemoval(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let  sortedQueries = queries.sorted { $0[0] < $1[0]}
        var heap = Heap<Int>()
        var j = 0
        let n = nums.count
        var sumDiff = 0
        var diff = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            sumDiff += diff[i]
            while j < queries.count && sortedQueries[j][0] <= i {
                heap.insert(sortedQueries[j][1])
                j += 1
            }
            while sumDiff < nums[i] && !heap.isEmpty && heap.max! >= i  {
                sumDiff += 1
                diff[heap.max! + 1] -= 1
                let _ = heap.popMax()
            }
            guard sumDiff >= nums[i] else {return -1}
        }
        return heap.count
    }
}