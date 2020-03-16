// https://leetcode.com/problems/lucky-numbers-in-a-matrix/
class Solution {
    
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty || !matrix[0].isEmpty else {
            return []
        }
        var ans = [Int]()
        for r in 0..<matrix.count {
            var c1 = -1
            for c in 0..<matrix[0].count {
                if c1 == -1 {
                    c1 = c
                    continue
                }
                if matrix[r][c] < matrix[r][c1] {
                    c1 = c
                }
            }
            var isLuckyNumber = true
            for r1 in 0..<matrix.count {
                if matrix[r1][c1] > matrix[r][c1] {
                    isLuckyNumber = false
                    break
                }
            }
            if isLuckyNumber {
                ans.append(matrix[r][c1])
            }
        }
        return ans
    }
}

