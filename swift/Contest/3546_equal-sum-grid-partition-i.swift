// https://leetcode.com/problems/equal-sum-grid-partition-i/
class Solution {
    func canPartitionGrid(_ grid: [[Int]]) -> Bool {

        return check(grid) || check(transpose(of: grid))
    }


    func check(_ martrix: [[Int]]) -> Bool {
        let rowsSums = martrix.map { $0.reduce(0) { $0 + $1}}
        let total = rowsSums.reduce(0) { $0 + $1}
        var curSum = 0
        for sum in rowsSums {
            if curSum == total - curSum {
                return true
            }
            curSum += sum
        }
        return false
    }

    func transpose(of matrix: [[Int]]) -> [[Int]] {
        let M = matrix.count
        let N = matrix[0].count
        var ans = [[Int]]()
        for c in 0..<N {
            var arr = [Int]()
            for r in 0..<M {
                arr.append(matrix[r][c])
            }
            ans.append(arr)
        }
        return ans
    }
}