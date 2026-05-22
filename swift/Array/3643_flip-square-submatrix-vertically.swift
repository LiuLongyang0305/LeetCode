//https://leetcode.cn/problems/flip-square-submatrix-vertically/
class Solution {
    func reverseSubmatrix(_ grid: [[Int]], _ x: Int, _ y: Int, _ k: Int) -> [[Int]] {
        var sb = grid
        let M = grid.count
        let N = grid[0].count

        for dx in 0..<k {
            for dy in 0..<k {
                sb[x + dx][y + dy] = grid[x + k - 1 - dx][y + dy]
            }
        }
        return sb
    }
}
