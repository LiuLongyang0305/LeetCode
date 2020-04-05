// https://leetcode.com/problems/minimum-subsequence-in-non-increasing-order/
class Solution {
    
    func minSubsequence(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted { $0 > $1}
        let totlSum = nums.reduce(0) {$0 + $1}
        var ans = [Int]()
        var sum = 0
        for i in 0..<nums.count {
            sum += sortedNums[i]
            ans.append(sortedNums[i])
            if sum > totlSum - sum  {
                break
            }
        }
        return ans
    }
}