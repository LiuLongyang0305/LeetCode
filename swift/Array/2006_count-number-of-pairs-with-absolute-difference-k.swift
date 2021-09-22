// https://leetcode.com/problems/count-number-of-pairs-with-absolute-difference-k/
class Solution {
    func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var counter = [Int](repeating: 0, count: 105)
        nums.forEach { num in
            if num + k <= 100 {
                ans += counter[num + k]
            }
            if num - k >= 0 {
                ans += counter[num - k]
            }
            counter[num] += 1
        }
        return ans
    }
}