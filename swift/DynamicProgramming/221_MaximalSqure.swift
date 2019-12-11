// https://leetcode.com/problems/maximal-square/
 class Solution1 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else {
            return 0
        }
        var maxSqureLength = 0
        let row = matrix.count
        let col = matrix[0].count
        func valid(x: Int, y: Int,squreLength: Int) -> Bool {
            let targetX = x + squreLength - 1
            let targetY = y + squreLength - 1
            for dx in x...targetX {
                if matrix[dx][targetY] == "0" {
                    return false
                }
            }
            for dy in y...targetY {
                if matrix[targetX ][dy] == "0" {
                    return false
                }
            }
            return true
        }
        for x in 0..<row {
            for y in 0..<col{
                if  matrix[x][y] == "1" {
                    maxSqureLength = max(maxSqureLength, 1)
                    let tempMaxSqureLength =  min(row - x, col - y)
                    if tempMaxSqureLength > maxSqureLength && tempMaxSqureLength >= 2 {
                        for squreLength in 2...tempMaxSqureLength {
                            if !valid(x: x, y: y, squreLength: squreLength) {
                                break
                            }
                            maxSqureLength = max(squreLength, maxSqureLength)
                        }
                    }
                }
            }
        }
        return maxSqureLength * maxSqureLength
    }
 }
 
 class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else {
            return 0
        }
        var maxSqureLength = 0
        let row = matrix.count
        let col = matrix[0].count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: col + 1), count: row + 1)
        for x in 1...row {
            for y in 1...col{
                if matrix[x - 1][y - 1] == "1" {
                    dp[x][y] = min(dp[x - 1][y], dp[x][y - 1], dp[x - 1][y - 1]) + 1
                    maxSqureLength = max(dp[x][y], maxSqureLength)
                }
            }
        }
        return  maxSqureLength * maxSqureLength
    }
 }
