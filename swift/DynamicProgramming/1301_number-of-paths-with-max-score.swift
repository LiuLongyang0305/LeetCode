// https://leetcode.com/problems/number-of-paths-with-max-score/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(1,0),(0,1),(1,1)]
    private let MOD = 1_000_000_007
    private typealias MaxScore = (score:Int,cnt:Int)
    func pathsWithMaxScore(_ board: [String]) -> [Int] {
        
        let M = board.count
        let N = board[0].count
        var scores = [Character:Int]()
        ("0123456789").forEach { scores[$0] = Int($0.asciiValue!) - 48}
        var boardChars = board.map { [Character]($0)}
        boardChars[M - 1][N - 1] = "0"
        
        var dp = Array<Array<MaxScore>>(repeating: Array<MaxScore>(repeating: (-1,-1), count: N), count: M)
        dp[0][0] = (0,1)
        
        for r in 0..<M {
            for c in 0..<N {
                guard boardChars[r][c] != "X" && dp[r][c] != (-1,-1) else {
                    //                    print("\(r)\(c)")
                    continue
                }
                for dir in directions {
                    let newX = dir.dx + r
                    let newY = dir.dy + c
                    if newX < M && newY < N && boardChars[newX][newY] != "X" {
                        let score = dp[r][c].score + scores[boardChars[newX][newY]]!
                        if score > dp[newX][newY].score {
                            dp[newX][newY] = (score,dp[r][c].cnt)
                        } else if score == dp[newX][newY].score {
                            dp[newX][newY].cnt = (dp[r][c].cnt + dp[newX][newY].cnt) % MOD
                        }
                    }
                }
            }
        }
        guard dp[M - 1][N - 1] != (-1,-1) else {
            return [0,0]
        }
        return [dp[M - 1][N - 1].score,dp[M - 1][N - 1].cnt]
    }
}