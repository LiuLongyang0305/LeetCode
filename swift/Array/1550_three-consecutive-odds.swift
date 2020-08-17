// https://leetcode.com/problems/three-consecutive-odds/
class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        guard arr.count > 2 else {
            return false
        }
        let nums = arr.map {$0 % 2}
        var curSum = 0
        for i in 0..<arr.count {
            curSum += nums[i]
            if i > 2 {
                curSum -= nums[i - 3]
            }
            guard curSum != 3 else {
                return true
            }
        }
        return false
    }
}

