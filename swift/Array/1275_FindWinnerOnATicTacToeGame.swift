//https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/
 class Solution {
    enum GameResult: String {
        case draw = "Draw"
        case pending = "Pending"
        case plarerA = "A"
        case plarerB = "B"
        case unknown = "unkonwn"
    }
    func tictactoe(_ moves: [[Int]]) -> String {
        var board = Array<Array<Character>>(repeating: Array<Character>(repeating: " ", count:3), count: 3)
        for i in 0..<moves.count {
            if i % 2 == 0  {
                board[moves[i][0]][moves[i][1]] = "X"
            } else {
                board[moves[i][0]][moves[i][1]] = "O"
            }
        }
        func checkBoardFor(player: Character) -> GameResult {
            let targetChar = player ==  "A" ? "X" : "O"
            let targetStr = "\(targetChar)\(targetChar)\(targetChar)"
            let winner = player  == "A" ? GameResult.plarerA : GameResult.plarerB
            if "\(board[0][0])\(board[0][1])\(board[0][2])" == targetStr || "\(board[1][0])\(board[1][1])\(board[1][2])" == targetStr || "\(board[2][0])\(board[2][1])\(board[2][2])" == targetStr || "\(board[0][0])\(board[1][0])\(board[2][0])" == targetStr || "\(board[0][1])\(board[1][1])\(board[2][1])" == targetStr || "\(board[0][2])\(board[1][2])\(board[2][2])" == targetStr  || "\(board[0][0])\(board[1][1])\(board[2][2])" == targetStr || "\(board[0][2])\(board[1][1])\(board[2][0])" == targetStr {
                return winner
            }
            return GameResult.unknown
        }
        
        func checkBoard() -> GameResult {
            if checkBoardFor(player: "A") != GameResult.unknown {
                return GameResult.plarerA
            }
            if checkBoardFor(player: "B")  != GameResult.unknown {
                return GameResult.plarerB
            }
            if moves.count == 9 {
                return GameResult.draw
            }
            return GameResult.pending
        }
        
        return checkBoard().rawValue
    }
 }
