//https://leetcode.cn/contest/zj-future2022/problems/GVbKaI/
class Solution {
    func minSwaps(_ chess: [Int]) -> Int {

        let N = chess.count
        var pre = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            pre[i + 1] = pre[i] + chess[i]
        }
        let M = pre.last ?? 0
        var ans = Int.max
        var l = 0
        while true {
            let r = M + l - 1
            guard r < N else {
                break
            }

            ans = min(ans, M - (pre[r + 1] - pre[l]))
            l += 1
        }

        return ans
    }
}