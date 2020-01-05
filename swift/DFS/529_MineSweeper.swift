//https://leetcode.com/problems/minesweeper/
 class Solution {
    let directions = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        var boardCopy = board
        guard boardCopy[click[0]][click[1]] != "M" else {
            boardCopy[click[0]][click[1]]  = "X"
            return boardCopy
        }
        
        let M = boardCopy.count
        let N = boardCopy[0].count
        
        func valid(_ x: Int, _ y: Int ) -> Bool {
            return x >= 0 && x < M && y >= 0 && y < N
        }
        func reveal(_ x: Int, _ y: Int) {
            guard valid(x, y) else {
                return
            }
            if boardCopy[x][y] == "E" {
                var count = 0
                for dir in directions {
                    if valid(x + dir[0], y + dir[1]) && boardCopy[x + dir[0]][y + dir[1]] == "M" {
                        count += 1
                    }
                }
                if count > 0 {
                    boardCopy[x][y] = Character("\(count)")
                } else {
                    boardCopy[x][y] = "B"
                    for dir in directions {
                        reveal(x + dir[0], y + dir[1])
                    }
                }
            }
        }
        reveal(click[0], click[1])
        return boardCopy
    }
 }
