//https://leetcode.cn/problems/minimum-possible-maximum-waiting-time/
class Solution {
    private typealias Pair = (maxNum:Int, bestWaitTime:Int)
    func minMaxWaitingTime(_ demand: [Int], _ fuel: [Int]) -> Int {
        var memo = [Int:Pair]()
        let sb = dfs(0, 0, 0, fuel[0], fuel[1], demand, &memo)
        return sb.maxNum == 0 ? -1 : sb.bestWaitTime
    }
    private func dfs(_ i: Int, _ wait0: Int, _ wait1:Int, _ fuel0: Int, _ fuel1:Int,_ demand: [Int], _ memo: inout [Int:Pair]) -> Pair {
        guard i < demand.count else {
            return (0,0)
        }
        let key = (i << 24) | (wait0 << 18) | (wait1 << 12) | (fuel0 << 6) | fuel1
        if let sb = memo[key] {return sb}
        var maxNum = 0
        var bestWaitTime = 0
        let d = demand[i]
        if d <= fuel0 {
            let ans = dfs(i + 1, d, max(wait1 - wait0,0), fuel0 - d, fuel1, demand, &memo)
            maxNum = ans.maxNum + 1
            bestWaitTime = max(ans.bestWaitTime, wait0)
        }
        //选择加油机1等wait1开始加油，加油机0的等待时间减少wait1秒
        if d <= fuel1 {
            let ans = dfs(i + 1, max(wait0 - wait1,0), d, fuel0, fuel1 - d, demand, &memo)
            let num = ans.maxNum + 1
            let time = max(ans.bestWaitTime,wait1)
            if num > maxNum ||  num == maxNum && time < bestWaitTime {
                maxNum = num
                bestWaitTime = time
            }
        }
        let sb: Pair = (maxNum,bestWaitTime)
        memo[key] = sb
        return sb
    }
}

