// https://leetcode.com/problems/design-tic-tac-toe/
class TicTacToe {
    private typealias Memo = [Int:Int]
    private let N: Int
    private var memo: [[Memo]] = [[],[[:],[:],[:],[:]],[[:],[:],[:],[:]]]
    
    /** Initialize your data structure here. */
    init(_ n: Int) {
        self.N = n
    }
    
    /** Player {player} makes a move at ({row}, {col}).
     @param row The row of the board.
     @param col The column of the board.
     @param player The player, can be either 1 or 2.
     @return The current winning condition, can be either:
     0: No one wins.
     1: Player 1 wins.
     2: Player 2 wins. */
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        return update(row, col, player)
    }
    private func update(_ row: Int, _ col: Int, _ player: Int) -> Int {
        memo[player][0][row,default: 0] += 1
        if let c = memo[player][0][row], c == N  {
            return player
        }
        memo[player][1][col,default: 0] += 1
        if let c = memo[player][1][col], c == N  {
            return player
        }
        memo[player][2][row - col,default: 0] += 1
        if let c = memo[player][2][row - col], c == N  {
            return player
        }
        memo[player][3][row + col,default: 0] += 1
        
        return memo[player][3][row + col]! == N ? player : 0
    }
}

/**
 * Your TicTacToe object will be instantiated and called as such:
 * let obj = TicTacToe(n)
 * let ret_1: Int = obj.move(row, col, player)
 */
