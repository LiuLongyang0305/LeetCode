// https://leetcode.com/problems/battleships-in-a-board/
class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var sum = 0
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "X" {
                    if i == 0 && j == 0 {
                        sum += 1
                        continue
                    }
                    if i == 0 || j == 0 {
                        if i == 0 && board[i][j - 1]  != "X"{
                            sum += 1
                        }
                        if j == 0 && board[i - 1][j] != "X" {
                            sum += 1
                        }
                        continue
                    }
                    if board[i - 1][j] != "X" &&  board[i][j - 1] != "X" {
                        sum += 1
                    }
                }
            }
        }
        return sum
    }
 }