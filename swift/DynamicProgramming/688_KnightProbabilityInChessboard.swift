//https://leetcode.com/problems/knight-probability-in-chessboard/ 
class Solution {
    typealias Direction = (dx:Int,dy:Int)
    let directions: [Direction] = [(-2,-1),(-2,1),(2,1),(2,-1),(1,-2),(1,2),(-1,2),(-1,-2)]
    func knightProbability(_ N: Int, _ K: Int, _ r: Int, _ c: Int) -> Double {
        guard N != 1 else {
            return K == 0 ? 1.0 : 0.0
        }
        func valid(_ x: Int,_ y: Int) -> Bool {
            return x >= 0 && x < N && y >= 0 && y < N
        }
        var dp = Array<Array<Double>>(repeating: Array<Double>(repeating: 0.0, count: N), count: N)
        dp[r][c] = 1
        for _ in 1...K {
            var dp2 = Array<Array<Double>>(repeating: Array<Double>(repeating: 0.0, count: N), count: N)
            for x in 0..<N {
                for y in 0..<N {
                    for dir in directions {
                        let nextX = x + dir.dx
                        let nextY = y + dir.dy
                        if  valid(nextX, nextY) {
                            dp2[nextX][nextY] += dp[x][y] / 8.0
                        }
                    }
                }
            }
            dp = dp2
        }
        var ans = 0.0
        for row in dp {
            for p in row {
                ans += p
            }
        }
        return ans
    }
 }