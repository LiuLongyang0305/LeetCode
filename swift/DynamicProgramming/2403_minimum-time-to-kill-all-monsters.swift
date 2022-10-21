// https://leetcode.com/problems/minimum-time-to-kill-all-monsters/
class Solution {
    func minimumTime(_ power: [Int]) -> Int {

        let N = power.count

        var memo = [Int?](repeating: nil, count: (1 << N) + 10)
        func dfs(_ visited: Int) -> Int {
            guard visited.nonzeroBitCount < N else {
                return 0
            }
            if let c = memo[visited] {
                return c
            }
            let gain = visited.nonzeroBitCount + 1
            var ans = Int.max >> 1

            for i in 0..<N {
                guard visited & (1 << i) == 0 else {continue}
                let needDays = power[i] / gain + min(power[i] % gain, 1)
                ans = min(ans, needDays + dfs(visited | (1 << i)))
            }
            memo[visited] = ans
            return ans

        }



        return dfs(0)
    }
}
