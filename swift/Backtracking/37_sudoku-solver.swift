// https://leetcode.com/problems/sudoku-solver/
extension Int {
    var ctz: Int {
        var ans = 0
        var temp = self
        while temp & 0x1 == 0 {
            temp = temp >> 1
            ans += 1
        }
        return ans
    }
}
class Solution {
    private var lines = [Int]()
    private var columns = [Int]()
    private var blocks = [[Int]]()
    private var valid: Bool = false
    private var spaces = [(Int,Int)]()
    // private let nums = [1,2,3,4,5,6,7,8,9]
    func solveSudoku(_ board: inout [[Character]]) {
        self.lines = Array<Int>(repeating: 0, count: 9)
        self.columns = Array<Int>(repeating: 0, count: 9)
        self.blocks = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 3), count: 3)
        self.valid = false
        self.spaces = []
        
        for r in 0..<9 {
            for c in 0..<9 {
                if board[r][c] == "." {
                    spaces.append((r,c))
                } else {
                    let digit = Int(board[r][c].asciiValue! - 48 - 1)
                    flip(r, c, digit)
                }
            }
        }
        dfs(&board, 0)
    }
    
    private func flip(_ r: Int, _ c: Int, _ digit: Int) {
        self.lines[r] ^= (1 << digit)
        self.columns[c] ^= (1 << digit)
        self.blocks[r / 3][c / 3] ^= (1 << digit)
    }
    
    private func dfs(_ board: inout [[Character]],_ pos: Int) {
        guard pos != spaces.count else {
            valid = true
            return
        }
        let (curRow,curCol) = spaces[pos]
        var mask = ~(lines[curRow] | columns[curCol] | blocks[curRow / 3][curCol / 3]) & 0x1ff
        while mask > 0 && !valid {
            let digitMask = mask & (-mask)
            let digit = digitMask.ctz
            flip(curRow, curCol, digit)
            board[curRow][curCol] = Character(Unicode.Scalar.init(49 + digit)!)
            dfs(&board, pos + 1)
            flip(curRow, curCol, digit)
            mask &= (mask - 1)
        }
    }
}

