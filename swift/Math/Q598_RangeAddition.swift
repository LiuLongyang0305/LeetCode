//https://leetcode.com/problems/range-addition-ii/
class Solution {

    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        var minx = m
        var minY = n
        for ope in ops {
            if minx > ope[0] {
                minx = ope[0]
            }
            if minY > ope[1] {
                minY = ope[1]
            }
        }
        return minY * minx
    }
}