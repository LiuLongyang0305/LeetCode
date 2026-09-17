//https://leetcode.cn/problems/cyclically-shift-rows-and-columns/
class Solution {
    func cyclicShift(_ n: Int, _ grid: [[Int]], _ rowShift: [Int], _ colShift: [Int]) -> [[Int]] {
        var sb = grid
        for i in 0..<n {
            if rowShift[i] > 0 {
                let row = [Int](sb[i].dropFirst(rowShift[i])) + [Int](sb[i].prefix(rowShift[i]))
                sb[i] = row
            }
        }

        func update(_ col:Int, _ delta: Int) {
            let tempRow = makeColAsOneRow(col)
            let shiftedRow = [Int](tempRow.dropFirst(delta)) + [Int](tempRow.prefix(delta))
            for r in 0..<n {
                sb[r][col] = shiftedRow[r]
            }
        }


        func makeColAsOneRow(_ col: Int) -> [Int] {
            var ans = [Int]()
            for r in 0..<n {
                ans.append(sb[r][col])
            }
            return ans
        }

        for i in 0..<n {
            if colShift[i] > 0 {
                update(i,colShift[i])
            }
        }
        return sb
    }
}
