// https://leetcode.com/problems/binary-trees-with-factors/
class Solution {
    private let MOD = 1_000_000_007
    func numFactoredBinaryTrees(_ A: [Int]) -> Int {
        let N = A.count
        let sortedA = A.sorted()
        var dp = Array<Int>(repeating: 1, count: N)
        var indices = [Int:Int]()
        for idx in 0..<N {
            indices[sortedA[idx]] = idx
        }
        for i in 0..<N {
            for j in 0..<N {
                if sortedA[i] % sortedA[j] == 0 {
                    let right = sortedA[i] / sortedA[j]
                    if let idx = indices[right] {
                        dp[i] = (dp[i] + dp[j] * dp[idx]) % MOD
                    }
                }
            }
        }
        return dp.reduce(0) { ($0 + $1) % MOD}
    }
}

