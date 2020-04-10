// https://leetcode.com/problems/number-of-corner-rectangles/
class Solution {
    func countCornerRectangles(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        
        var rows = Array<[Int]>(repeating: [], count: M)
        var cols = Array<Set<Int>>(repeating: [], count: N)
        
        for r in 0..<M {
            for c in 0..<N {
                if grid[r][c] == 1 {
                    rows[r].append(c)
                    cols[c].insert(r)
                }
            }
        }
        var ans = 0
        for c1 in 0..<(N - 1) {
            for c2 in (c1 + 1)..<N {
                var count = 0
                for num in cols[c1] {
                    if cols[c2].contains(num) {
                        count += 1
                    }
                }
                if count >= 2 {
                    ans += count * (count - 1) / 2
                }
            }
        }
        return ans
    }
}
