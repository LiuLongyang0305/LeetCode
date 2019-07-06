//https://leetcode.com/problems/broken-calculator/
class Solution {
    func brokenCalc(_ X: Int, _ Y: Int) -> Int {
        var ans = 0
        var y = Y
        while y > X {
            y = y % 2 == 0 ? y / 2 : y + 1
            ans += 1
        }
        return ans + X - y
    }
}