//https://leetcode.cn/problems/smallest-index-with-digit-sum-equal-to-index/
class Solution {
    func smallestIndex(_ nums: [Int]) -> Int {

        for i in 0..<nums.count{
            if i == getDigitsSum(of: nums[i]) {
                return i
            }
        }
        return -1
    }
    private func getDigitsSum(of num:  Int) -> Int {
        var t = num
        var ans = 0
        while t > 0 {
            ans += (t % 10)
            t /= 10
        }
        return ans
    }
}