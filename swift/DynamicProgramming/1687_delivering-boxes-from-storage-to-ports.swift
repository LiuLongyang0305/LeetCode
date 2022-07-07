 // https://leetcode.com/problems/delivering-boxes-from-storage-to-ports/
class Solution {
    private struct Box {
        var port:Int
        var weight:Int
    }
    func boxDelivering(_ _boxes: [[Int]], _ portsCount: Int, _ maxBoxes: Int, _ maxWeight: Int) -> Int {


        let boxes = _boxes.map { Box(port: $0[0], weight: $0[1])}
        var preffix = [0]
        boxes.forEach { preffix.append((preffix.last ?? 0 ) + $0.weight)}
        let N = boxes.count

        var dp = [Int](repeating: -1, count: N + 5)
        ///枚举第一次运送的箱子
        func dfs(_ startIdx:Int) -> Int {

            guard startIdx < N else {return 0}
            guard -1 == dp[startIdx]  else {
                return dp[startIdx]
            }

            var tripsCnt = 1
            var idx = startIdx
            var lastPort = -1
            var lastPortIdx = -1
            var portCnt = 0
            while idx < N && idx - startIdx + 1 <= maxBoxes && preffix[idx + 1] - preffix[startIdx] <= maxWeight  {
                if boxes[idx].port != lastPort {
                    tripsCnt += 1
                    lastPort = boxes[idx].port
                    lastPortIdx = idx
                    portCnt += 1
                }

                idx += 1
            }
            var ans =  tripsCnt + dfs(idx)
            if portCnt > 1 {
                if idx < N && boxes[idx].port == boxes[lastPortIdx].port {
                    ans = min(ans, tripsCnt - 1 + dfs(lastPortIdx))
                }
            }

            dp[startIdx] = ans
            return ans
        }

        return dfs(0)
    }
}