// https://leetcode.com/problems/check-if-move-is-legal/
class Solution {
    func checkMove(_ board: [[Character]], _ rMove: Int, _ cMove: Int, _ color: Character) -> Bool {
        var copy = board
        copy[rMove][cMove] = color
        //row
        guard !check(copy[rMove], cMove) else {
            return true
        }
        // col
        var col = [Character]()
        for r in 0...7 {
            col.append(copy[r][cMove])
        }
        guard !check(col, rMove) else {
            return true
        }
        //对角线
        var pie = [Character]()
        var na = [Character]()
        let pieTarget  = rMove + cMove
        let naTarget = rMove - cMove
        var piePos = -1
        var naPos = -1
        for r in 0...7 {
            for c in 0...7 {
                if r + c == pieTarget {
                    pie.append(copy[r][c])
                }
                if r - c == naTarget {
                    na.append(copy[r][c])
                }
                if r == rMove && c == cMove {
                    piePos = pie.count - 1
                    naPos = na.count - 1
                }
            }
        }
        return check(pie, piePos) || check(na, naPos)
    }
    
    private func check(_ board: [Character], _ pointPosition: Int) -> Bool {
        guard board.count >= 3 else {
            return false
        }
        let N = board.count
        let segmentPointColor = board[pointPosition]
        let pointsTargetColor: Character = segmentPointColor == "B" ? "W" : "B"
        //以pos为右端点
        if pointPosition > 0 {
            var i = pointPosition - 1
            while i >= 0 && board[i] == pointsTargetColor {
                i -= 1
            }
            if i >= 0 && board[i] == segmentPointColor {
                if pointPosition - i + 1 >= 3 {
                    return true
                }
            }
        }
        //以pos为左端点
        if pointPosition < N - 1 {
            var i = pointPosition + 1
            while i < N && board[i] == pointsTargetColor {
                i += 1
            }
            if i < N && board[i] == segmentPointColor {
                if i - pointPosition + 1 >= 3 {
                    return true
                }
            }
        }
        return false
    }
}