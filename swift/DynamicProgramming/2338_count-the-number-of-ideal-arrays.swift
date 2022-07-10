 // https://leetcode.com/problems/count-the-number-of-ideal-arrays/
class Solution {
    private var combination = [[Int]](repeating: [Int](repeating: 0, count: 15), count: 10005)
    private let MOD = 1_000_000_007
    init() {
        for i in 0...10000 {
            for j in 0..<15 {
                guard j <= i else {continue}
                if 0 == j {
                    combination[i][j] = 1
                } else {
                    combination[i][j] = (combination[i - 1][j] + combination[i - 1][j - 1]) % MOD
                }
            }
        }
    }
    func idealArrays(_ n: Int, _ maxValue: Int) -> Int {

        var ans = 0
        func dfs(_ last: Int, _ cnt: Int ) {
            ans += combination[n - 1][cnt - 1]
            ans %= MOD
            guard cnt < n else {return}
            var i = 2
            while i * last <= maxValue {
                dfs(i * last, cnt + 1)
                i += 1
            }
        }
        for i in 1...maxValue {
            dfs(i, 1)
        }
        return ans
    }
}
