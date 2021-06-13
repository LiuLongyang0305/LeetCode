// https://leetcode.com/problems/check-if-all-the-integers-in-a-range-are-covered/
class Solution {
    private var ranges = [[Int]]()
    func isCovered(_ ranges: [[Int]], _ left: Int, _ right: Int) -> Bool {
        self.ranges = ranges
        for num in left...right {
            guard isCovered(num) else {
                return false
            }
        }
        return true
    }
    private func isCovered(_ num: Int) -> Bool {
        for range in ranges {
            if num >= range[0] && num <= range[1]   {
                return true
            }
        }
        return false
    }
}