// https://leetcode.com/problems/sum-of-unique-elements/
class Solution {
    func sumOfUnique(_ nums: [Int]) -> Int {
        var ans = 0
        var cnt = Array<Int>(repeating: 0, count: 101)
        for num in nums {
            cnt[num] += 1
        }
        for idx in 0...100 {
            if cnt[idx] == 1 {
                ans += idx
            }
        }
        return ans
    }
}

