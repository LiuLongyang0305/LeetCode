//https://leetcode.com/problems/minimum-moves-to-equal-array-elements-ii/submissions/
class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        let sortedNums = nums.sorted()
        var ans = Int.max
        
        let totalSum = nums.reduce(0) {$0 +  $1}
        
        var temp = 0
        var count = 0
        for i in 0..<sortedNums.count {
            ans = min(ans, totalSum - temp << 1 + sortedNums[i] * (count << 1 - nums.count))
            temp += sortedNums[i]
            count += 1
        }
        return ans
    }
}