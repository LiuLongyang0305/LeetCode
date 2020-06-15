// https://leetcode.com/problems/subrectangle-queries/
class SubrectangleQueries {
    private var rectangle: [[Int]]
    private  struct UpdateInfo {
        var row1: Int
        var col1: Int
        var row2: Int
        var col2: Int
        var newValue: Int
    }
    private var updateInfos = [UpdateInfo]()
    init(_ rectangle: [[Int]]) {
        self.rectangle = rectangle
    }
    
    func updateSubrectangle(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int, _ newValue: Int) {
        updateInfos.append(UpdateInfo(row1: row1, col1: col1, row2: row2, col2: col2, newValue: newValue))
    }
    
    func getValue(_ row: Int, _ col: Int) -> Int {
        let N = updateInfos.count
        for i in stride(from: N - 1, through: 0, by: -1) {
            if row >= updateInfos[i].row1 && row <= updateInfos[i].row2 && col >= updateInfos[i].col1 && col <= updateInfos[i].col2 {
                return updateInfos[i].newValue
            }
        }
        return rectangle[row][col]
    }
}


/**
 * Your SubrectangleQueries object will be instantiated and called as such:
 * let obj = SubrectangleQueries(rectangle)
 * obj.updateSubrectangle(row1, col1, row2, col2, newValue)
 * let ret_2: Int = obj.getValue(row, col)
 */