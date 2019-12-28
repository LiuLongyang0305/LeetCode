//https://leetcode.com/problems/out-of-boundary-paths/
class Solution {
    private let dx = [0,0,-1,1]
    private let dy = [1,-1,0,0]
    private  let MOD = 1_000_000_007
    typealias Position = (x:Int,y: Int)
    func findPaths(_ m: Int, _ n: Int, _ N: Int, _ i: Int, _ j: Int) -> Int {
        guard N > 0 else {
            return 0
        }
        var ans = 0
        var count = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n), count: m)
        count[i][j] = 1
        for _ in 0..<N {
            var temp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n), count: m)
            for r in 0..<m {
                for c in 0..<n {
                    for i in 0..<4 {
                        let nr = r + dx[i]
                        let nc = c + dy[i]
                        if nr < 0 || nc < 0 || nr == m || nc == n {
                            ans = (ans + count[r][c]) % MOD
                            continue
                        }
                        temp[nr][nc] = (temp[nr][nc] + count[r][c]) % MOD
                    }
                }
            }
            count = temp
        }
        return ans % MOD
    }
 }