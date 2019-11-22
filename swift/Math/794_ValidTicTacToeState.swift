//https://leetcode.com/problems/valid-tic-tac-toe-state/
class Solution {
    private let N = 3
    func validTicTacToe(_ board: [String]) -> Bool {
        var counter: [Int] = [0,0]
        let boardChars: [[Character]] = board.map{[Character]($0)}
        //计数
        for i in 0..<N {
            for j in 0..<N {
                if boardChars[i][j] == "X" {
                    counter[0] += 1
                } else if boardChars[i][j] == "O" {
                    counter[1] += 1
                }
            }
        }
        //必须满足第一个玩家多放置字符一次或者两个玩家放置字符次数相同
        guard counter[0] >= counter[1]  && counter[0] - counter[1] <= 1 else {
            return  false
        }
        //其他状态一定可以达到
        guard isGameEnded(boardChars) else {
            return true
        }
        //如果当前游戏是结束状态，要想达到此状态，需要移除最后一个放置的字符并且移除之后游戏非结束状态
        if counter[0] - counter[1] == 0 {
            return validWhenGameEnded(boardChars, remove: "O")
        } else {
            return validWhenGameEnded(boardChars, remove: "X")
        }
    }
    
    private func isGameEnded(_ board: [[Character]]) -> Bool {
        //游戏结束：行满足
        for i in 0..<N {
            var str = ""
            for j in 0..<N {
                str.append(board[i][j])
            }
            if str == "XXX" || str == "OOO" {
                return true
            }
        }
        //游戏结束：列满足
        for i in 0..<N {
            var str = ""
            for j in 0..<N {
                str.append(board[j][i])
            }
            if str == "XXX" || str == "OOO" {
                return true
            }
        }
        
        var str = ""
        //游戏结束：对角线满足
        for i in 0..<N {
            str.append(board[i][i])
        }
        if str == "XXX" || str == "OOO" {
            return true
        }
        str = ""
        for i in 0..<N {
            str.append(board[i][2 - i])
        }
        if str == "XXX" || str == "OOO" {
            return true
        }
        return false
    }
    //回溯判断上一状态是否游戏结束状态
    private func validWhenGameEnded(_ board: [[Character]], remove char: Character) -> Bool {
        var boardCopy = board
        for i in 0..<N {
            for j in 0..<N {
                if board[i][j] == char {
                    boardCopy[i][j] = " "
                    if !isGameEnded(boardCopy) {
                        return true
                    }
                    boardCopy[i][j] = char
                }
            }
        }
        return false
    }
}
