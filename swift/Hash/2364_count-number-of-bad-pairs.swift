// https://leetcode.com/problems/count-number-of-bad-pairs/
class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        let N = nums.count
        var ans = 0
        var counter = [Int:Int]()
        for i in 0..<N {
            counter[i - nums[i],default: 0] += 1
        }
        for (_,c) in counter {
            ans += c * (N - c)
        }
        return ans >> 1
    }
}