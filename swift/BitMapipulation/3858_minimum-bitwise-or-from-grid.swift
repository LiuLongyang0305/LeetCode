// https://leetcode.cn/problems/minimum-bitwise-or-from-grid/
class Solution {
    func minimumOR(_ grid: [[Int]]) -> Int {
        let mx = grid.map { $0.max()!}.max()!
        var sb = 0

        for curBit in stride(from: 32, to: -1, by: -1) {
            let mask = sb | ((1 << curBit) - 1)
            for row in grid {
                var findZero = false
                for x in row {
                    if x | mask == mask {
                        findZero = true
                        break
                    }
                }
                if !findZero {
                    sb = sb | (1 << curBit)
                    break
                }

            }
        }
        return sb
    }
}
