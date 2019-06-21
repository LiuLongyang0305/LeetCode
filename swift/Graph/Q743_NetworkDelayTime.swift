//https://leetcode.com/problems/network-delay-time/
class Solution {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var costTime = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max , count: N + 1), count: N + 1)
        for time in times {
            costTime[time[0]][time[1]] = time[2]
        }
        
        for i in 0...N {
            costTime[i][i] = 0
        }
        
        for i in 1...N {
            for j in 1...N {
                for k in 1...N {
                    if !(costTime[j][i] == Int.max || costTime[i][k] == Int.max) {
                        costTime[j][k] = min(costTime[j][k], costTime[j][i] + costTime[i][k])
                    }
                }
            }
        }
        var distanceToK = costTime[K]
        distanceToK.removeFirst()
        let maxDistance = distanceToK.max()!
        return maxDistance == Int.max ? -1 : maxDistance
    }
}