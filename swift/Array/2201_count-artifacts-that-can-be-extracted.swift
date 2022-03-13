// https://leetcode.com/problems/count-artifacts-that-can-be-extracted/
class Solution {
    func digArtifacts(_ n: Int, _ artifacts: [[Int]], _ dig: [[Int]]) -> Int {
        var isDigged = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        dig.forEach { d in
            isDigged[d[0]][d[1]] = true
        }
        func check(_ up:Int,_ down:Int, _ left: Int, _ right: Int) -> Bool {
            var r = up
            while r <= down {
                var c = left
                while c <= right {
                    guard isDigged[r][c] else {return false}
                    c += 1
                }
                r += 1
            }
            return true
        }
        
        
        
        var ans = 0
        for a in artifacts {
            if check(a[0], a[2], a[1],a[3]) {
                ans += 1
            }
        }
        return ans
    }
}