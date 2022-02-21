// https://leetcode.com/problems/count-equal-and-divisible-pairs-in-an-array/
class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        var ans = 0
        var i = 0
        while i < N {
            var j = i + 1
            while j < N {
                if nums[i] == nums[j] && i * j % k == 0 {
                    ans += 1
                }
                j += 1
            }
            i += 1
        }
        return ans
    }
}
