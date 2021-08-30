// https://leetcode.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/
class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        guard k  > 1 else {
            return  0
        }
        var ans = Int.max
        let sortedNums = nums.sorted()
        let N = sortedNums.count
        var i = 0
        while i  + k - 1 < N {
            ans = min(ans, sortedNums[i + k - 1] - sortedNums[i])
            i += 1
        }
        return ans
    }
}