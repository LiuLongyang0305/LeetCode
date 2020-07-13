// https://leetcode.com/problems/range-sum-of-sorted-subarray-sums/
class Solution {
    private let MOD = 1_000_000_007
    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        var subsequenceSums = [Int]()
        for i in 0..<n {
            var curSum = 0
            for j in i..<n {
                curSum += nums[j]
                subsequenceSums.append(curSum)
            }
        }
        subsequenceSums.sort()
        var ans = 0
        for i in left...right {
            ans += subsequenceSums[i - 1]
            ans %= MOD
        }
        return ans
    }
}