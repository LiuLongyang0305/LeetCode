//https://leetcode.com/problems/height-checker/
class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var count = 0
        var heightsCopy = heights
        heightsCopy.sort()
        for i in 0..<heightsCopy.count {
            if heights[i] != heightsCopy[i] {
                count += 1
            }
        }
        return count
    }
}