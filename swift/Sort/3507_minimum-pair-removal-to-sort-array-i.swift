//https://leetcode.com/problems/minimum-pair-removal-to-sort-array-i/
class Solution {
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        var cnt = 0
        var numsCopy = nums
        while numsCopy.count > 1 &&  numsCopy.sorted() != numsCopy {
            cnt += 1
            var minSum = Int.max
            var idx = -1
            for i in 1..<numsCopy.count {
                let t = numsCopy[i] + numsCopy[i - 1]
                if t < minSum {
                    minSum = t
                    idx = i - 1
                }
            }
            numsCopy[idx] = minSum
            numsCopy.remove(at: idx + 1)
        }
        return cnt
    }
}