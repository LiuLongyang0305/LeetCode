//https://leetcode.com/problems/cells-with-odd-values-in-a-matrix/
class Solution {
    func oddCells(_ n: Int, _ m: Int, _ indices: [[Int]]) -> Int {
        var ans = 0
        var counterRows = Array<Int>(repeating: 0, count: n)
        var counterCols = Array<Int>(repeating: 0, count: m)
        for indice in indices {
            counterRows[indice[0]] += 1
            counterCols[indice[1]] += 1
        }
        for r in 0..<n {
            for c in 0..<m {
                if (counterCols[c] + counterRows[r]) % 2 == 1 {
                    ans += 1
                }
            }
        }
        return ans
    }
}