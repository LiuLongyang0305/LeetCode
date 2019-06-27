//https://leetcode.com/problems/reshape-the-matrix/
class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {

        guard !nums.isEmpty && nums.count * nums[0].count == r * c else {
            return nums
        }
        guard r != nums.count else {
            return nums
        }
        var result = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: c), count: r)
        var i = 0
        var j = 0
        for row in nums {
            for ele in row {
                if j == c {
                    i += 1
                    j = 0
                }
                result[i][j] = ele
                j += 1
            }
        }
        return result
    }
}