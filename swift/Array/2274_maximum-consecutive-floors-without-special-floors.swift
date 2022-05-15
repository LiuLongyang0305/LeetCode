 //https://leetcode.com/problems/maximum-consecutive-floors-without-special-floors/
class Solution {
    func maxConsecutive(_ bottom: Int, _ top: Int, _ special: [Int]) -> Int {
        let sortedSpecial = special.sorted()
        var ans = 0

        var last = bottom

        for s in sortedSpecial {
            ans = max(ans, s - last)
            last = s + 1
        }


        ans = max(ans, top - last + 1)

        return ans
    }
}