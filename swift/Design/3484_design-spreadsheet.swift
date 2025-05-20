// https://leetcode.com/problems/design-spreadsheet/
class Spreadsheet {

    private var nums:[[Int]]
    init(_ rows: Int) {
        nums = [[Int]](repeating:[Int](repeating: 0, count: 26), count: rows + 1)
    }

    func setCell(_ cell: String, _ value: Int) {
        let (r,c) = complain(cell)
        nums[r][c] = value

    }

    func resetCell(_ cell: String) {
        let (r,c) = complain(cell)
        nums[r][c] = 0
    }

    func getValue(_ formula: String) -> Int {
        let cellsOrNums = formula.dropFirst().split { ch in
            ch == "+"
        }.map { String($0)}
        if let first = complain(cellsOrNums[0]) {
            if let  second = complain(cellsOrNums[1]) {
                return first + second
            } else {
                let (r,c) = complain(cellsOrNums[1])
                return first + nums[r][c]
            }
        } else {
            let (r1,c1) = complain(cellsOrNums[0])
            if let second = complain(cellsOrNums[1]) {
                return nums[r1][c1] + second
            } else {
                let (r,c) = complain(cellsOrNums[1])
                return nums[r1][c1] + nums[r][c]
            }
        }


    }

    private func complain(_ cell: String) -> (row:Int,col:Int) {
        let colNum = Int((cell.first!.asciiValue! - 65))
        let rowNum = Int(cell.dropFirst())!
        return (rowNum,colNum)
    }

    private func complain(_ str: String) -> Int? {
        return Int(str)
    }
}
/**
 * Your Spreadsheet object will be instantiated and called as such:
 * let obj = Spreadsheet(rows)
 * obj.setCell(cell, value)
 * obj.resetCell(cell)
 * let ret_3: Int = obj.getValue(formula)
 */