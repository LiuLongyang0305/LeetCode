// https://leetcode.com/problems/minimum-time-to-finish-the-race/

class Solution1 {
    private let INF = 2_000_000_000
    func minimumFinishTime(_ tires: [[Int ]], _ changeTime: Int, _ numLaps: Int) -> Int {
        let N = tires.count
        var  withoutChange = [[Int]](repeating: [Int](repeating: INF, count: 20), count: N)
        for i in 0..<N {
            withoutChange[i][1] = tires[i][0]
            for j in 2..<20 {
                let t = withoutChange[i][j - 1] * tires[i][1]
                guard t < INF else {continue}
                withoutChange[i][j] = t
            }
            for j in 2..<20 {
                let t = withoutChange[i][j - 1] + withoutChange[i][j]
                guard t < INF else {break}
                withoutChange[i][j] = t
            }
        }
        
        
        var dp = [Int](repeating: INF, count: numLaps + 1)
        for i in 0..<N {
            dp[1] = min(dp[1], tires[i][0])
        }
        
        for x in 1...numLaps {
            var t = INF
            if x < 20 {
                for i in 0..<N {
                    t = min(t, withoutChange[i][x])
                }
            }
            var j = x - 1
            while j > 0 && j >= x - 18 {
                t = min(t, dp[j] + changeTime + dp[x - j])
                j -= 1
            }
            dp[x] = t
        }
        return dp[numLaps]
    }
}


class Solution {
    private let INF = 2000000007
    func minimumFinishTime(_ tires: [[Int]], _ changeTime: Int, _ numLaps: Int) -> Int {
        var dp = [Int](repeating: INF, count: numLaps + 5)
        var best = [Int](repeating: INF, count: numLaps + 5)
        var maxLaps = 0
        
        
        func dfs(_ laps: Int) -> Int {
            guard laps > 0 else {return -changeTime}
            guard dp[laps] == INF else {return dp[laps]}
            
            var ans = INF
            for i in 1...min(laps, maxLaps) {
                ans = min(ans, best[i] + changeTime + dfs(laps - i))
            }
            dp[laps] = ans
            return ans
        }
        
        
        
        
        for tire  in tires {
            var lapTime = tire[0]
            var time = tire[0]
            var lap = 1
            while lap <= numLaps && lapTime < tire[0] + changeTime {
                maxLaps = max(maxLaps,lap)
                if best[lap] > time {
                    best[lap] = time
                }
                lapTime *= tire[1]
                time += lapTime
                lap += 1
            }
        }
        return dfs(numLaps)
    }
}
