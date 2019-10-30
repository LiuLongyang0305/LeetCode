//https://leetcode.com/problems/number-of-subarrays-with-bounded-maximum/
class Solution {
    func numSubarrayBoundedMax(_ A: [Int], _ L: Int, _ R: Int) -> Int {
        var lastLargeThanRNumIndex = -1
        var lastInTheRangeNumIndex = -1
        var ans = 0
        for i in 0..<A.count {
            if A[i] > R {
                lastLargeThanRNumIndex = i
            } else if A[i] < L {
                if lastInTheRangeNumIndex != -1 && lastInTheRangeNumIndex > lastLargeThanRNumIndex {
                    ans +=  lastInTheRangeNumIndex - lastLargeThanRNumIndex
                }
            } else {
                lastInTheRangeNumIndex = i
                ans += i - lastLargeThanRNumIndex
            }
        }
        return ans
    }
}