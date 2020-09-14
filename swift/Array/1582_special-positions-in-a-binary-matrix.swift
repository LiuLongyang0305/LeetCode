// https://leetcode.com/problems/special-positions-in-a-binary-matrix/
class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        var ans = 0
        var rows = [Int:Int]()
        var cols = [Int:Int]()
        for r in 0..<mat.count {
            for c in 0..<mat[r].count {
                if mat[r][c] == 1 {
                    rows[r, default: 0] += 1
                    cols[c, default: 0] += 1
                }
            }
        }
        for r in 0..<mat.count {
            for c in 0..<mat[r].count {
                if mat[r][c] == 1 {
                    if rows[r]! == 1 && cols[c]! == 1 {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}

