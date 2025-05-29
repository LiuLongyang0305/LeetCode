//https://leetcode.cn/problems/minimum-time-to-break-locks-i/
class Solution {
    private let INF = Int.max / 2
    func findMinimumTime(_ strength: [Int], _ k: Int) -> Int {

        let N = strength.count
        let maxMask = (1 << N) - 1
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: N * k + 20), count: (1 << N) + 10)
        func dfs(_ state: Int, _ deltaX: Int) -> Int {
            guard state < maxMask else {return 0}
            if let v = memo[state][deltaX] {
                return v
            }
            var ans = INF
            for i in 0..<N {
                if state & (1 << i) == 0 {
                    //处理
                    let newState = state | (1 << i)
                    let t = Int(ceil(Double(strength[i]) / Double(deltaX)))
                    ans = min(ans,  t + dfs(newState, deltaX + k ))
                }
            }
            memo[state][deltaX] = ans
            return ans
        }

        return dfs(0, 1)
    }
}
