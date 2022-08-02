// https://leetcode.com/problems/maximum-number-of-groups-entering-a-competition/
class Solution {
    func maximumGroups(_ grades: [Int]) -> Int {
        var ans = 0
        var i = 1
        var n = grades.count
        while n - i >= 0 {
            ans += 1
            n -= i
            i += 1
        }
        return ans
    }
}