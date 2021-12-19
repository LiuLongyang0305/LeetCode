// https://leetcode.com/problems/number-of-smooth-descent-periods-of-a-stock/
class Solution {
    func getDescentPeriods(_ prices: [Int]) -> Int {
        var ans = 0
        var last:Int? = nil
        var curLength = 0
        for num in prices {
            if let l = last {
                if num == l - 1 {
                    curLength += 1
                    last = l - 1
                } else {
                    ans += (curLength + 1) * curLength / 2
                    last = num
                    curLength = 1
                }
            } else {
                curLength = 1
                last = num
            }
        }
        ans += (curLength + 1) * curLength / 2
        return ans
    }
}
