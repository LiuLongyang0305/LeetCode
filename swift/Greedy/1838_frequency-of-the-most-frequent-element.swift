// https://leetcode.com/problems/frequency-of-the-most-frequent-element/
class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        
        let sortedNums = nums.sorted()
        var ans = 1
        var l = 0
        var total = 0
        
        for r in 1..<nums.count {
            total += (sortedNums[r] - sortedNums[r - 1]) * (r - l)
            while total > k {
                total -= sortedNums[r] - sortedNums[l]
                l += 1
            }
            ans = max(ans, r - l + 1)
        }
        return ans
    }
}