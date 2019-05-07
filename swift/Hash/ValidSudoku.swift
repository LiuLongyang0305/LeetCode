//https://leetcode.com/problems/valid-sudoku/
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        typealias ExistedPlaces = (rows: Set<Int>,cols:Set<Int>,blocks:Set<Int>)
        var dic = Dictionary<Character,ExistedPlaces>()
        for i in 0...8{
            for j in 0...8 {
                let currentBlock = i / 3 * 3 + j / 3
                if board[i][j] != "." {
                    if board[i][j] == "5" {
                        print("i = \(i), j = \(j) set = \(dic["5"]))")
                    }
                    if let existPlace = dic[board[i][j]] {
                        if existPlace.cols.contains(j) {
                            return false
                        } else {
                            dic[board[i][j]]!.cols.insert(j)
                        }
                        if existPlace.rows.contains(i){
                            return false
                        } else {
                            dic[board[i][j]]!.rows.insert(i)
                        }
                        if existPlace.blocks.contains(currentBlock) {
                            return false
                        } else {
                            dic[board[i][j]]!.blocks.insert(currentBlock)
                        }
                    } else {
                        var existPlaces : ExistedPlaces = (Set<Int>(),Set<Int>(),Set<Int>())
                        existPlaces.cols.insert(j)
                        existPlaces.rows.insert(i)
                        existPlaces.blocks.insert(currentBlock)
                        dic[board[i][j]] = existPlaces
                    }
                }
            }
        }
        return true
    }
}