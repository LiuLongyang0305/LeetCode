// https://leetcode.com/problems/equal-row-and-column-pairs/
class Solution {
    func equalPairs(_ grid: [[Int]]) -> Int {
        let N = grid.count
        var cnt = 0
        var map = [Int:Int]()
        for row in grid {
            map[row.hashValue,default: 0] += 1
        }

        //col

        for col in 0..<N {
            var curCol = [Int]()
            for row in 0..<N {
                curCol.append(grid[row][col])
            }
            if let c = map[curCol.hashValue] {
                cnt += c
            }
        }

        return cnt
    }
}
