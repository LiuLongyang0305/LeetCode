// https://leetcode.com/problems/number-of-rectangles-that-can-form-the-largest-square
class Solution {
    func countGoodRectangles(_ rectangles: [[Int]]) -> Int {
        var maxLen = 0
        var cnt = 0
        rectangles.forEach { (edges) in
            let squreLength = min(edges[0],edges[1])
            if squreLength == maxLen {
                cnt += 1
            } else if squreLength > maxLen {
                cnt = 1
                maxLen = squreLength
            }
        }
        return cnt
    }
}