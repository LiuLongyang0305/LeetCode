//https://leetcode.com/problems/maximum-number-of-distinct-elements-after-operations/
class Solution {
    func maxDistinctElements(_ nums: [Int], _ k: Int) -> Int {
        var cnt = 0
        var last = Int.min / 2
        for num in nums.sorted() {
            let cur = min(max(num - k, last + 1), num + k)
            if cur > last {
                cnt += 1
                last = cur
            }
        }
        return cnt
    }
}

