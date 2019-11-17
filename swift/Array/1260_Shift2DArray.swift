//https://leetcode-cn.com/problems/shift-2d-grid/
class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var arr = [Int]()
        for i in 0..<grid.count {
            arr.append(contentsOf: grid[i])
        }
        let time = k % arr.count
        let  length = arr.count
        let subStr = arr[(length - time)..<length]
        arr.removeLast(time)
        arr.insert(contentsOf: subStr, at: 0)
        var ans = [[Int]]()
        let cols = grid[0].count
        for i in 0..<grid.count {
            ans.append(Array<Int>(arr[(i * cols)..<(i + 1) * cols]))
        }
        return ans
    }
}