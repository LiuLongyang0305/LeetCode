// https://leetcode.com/problems/count-lattice-points-inside-a-circle/
class Solution {
    func countLatticePoints(_ circles: [[Int]]) -> Int {

        var visited = [[Bool]](repeating: [Bool](repeating: false, count: 210), count: 210)
        for  circle in circles {
            let cx = circle[0],cy = circle[1],r = circle[2]
            for x in (cx - r)...(cx + r) {
                for y in (cy - r)...(cy + r) {
                    if !visited[x][y] {
                        if (x - cx) * (x - cx) + (y - cy) * (y - cy) <= r * r {
                            visited[x][y] = true
                        }
                    }
                }
            }
        }


        var ans = 0
        for x in 0..<210 {
            for y in 0..<210 {
                if visited[x][y] {
                    ans += 1
                }
            }
        }

        return ans

    }
}