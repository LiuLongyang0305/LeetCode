class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        
        let row = board.count
        let col = board[0].count
        //边界检查
        func valid(x: Int,y: Int) -> Bool {
            return x >= 0 && x < row && y >= 0 && y < col
        }
        //8个方向
        let directions = [[0,1],[0,-1],[-1,0],[1,0],[-1,-1],[-1,1],[1,-1],[1,1]]
        //求解下一个时刻状态并保存在Bit1上
        for i in 0..<row {
            for j in 0..<col {
                //统计活细胞数
                var surroundedLiveCellCount = 0
                for direction in directions {
                    let x = i + direction[0]
                    let y = j + direction[1]
                    if valid(x: x, y: y) {
                        if board[x][y] & 1 == 1 {
                            surroundedLiveCellCount += 1
                        }
                    }
                }
                //判断下一时刻该位置细胞的存活情况
                func isStillAlive() -> Bool {
                    if board[i][j] == 1 {
                        return surroundedLiveCellCount == 2 || surroundedLiveCellCount ==  3
                    }
                    return surroundedLiveCellCount == 3
                }
                //如果存活，board[i][j]的Bit1置位；如果死亡，则原本就是0，无须处理
                if isStillAlive() {
                    board[i][j] |= 2
                }
            }
        }
        //更新所有细胞状态
        for i in 0..<row {
            for j in 0..<col {
                board[i][j] >>= 1
            }
        }
    }
}