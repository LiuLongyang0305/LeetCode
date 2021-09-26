// https://leetcode.com/problems/maximum-difference-between-increasing-elements/
class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var ans = -1
        var minEle = Int.max
        nums.forEach { num in
            if num > minEle {
                ans = max(ans, num - minEle)
            }
            minEle = min(minEle, num)
        }
        return ans
    }
}