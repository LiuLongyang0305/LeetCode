// https://leetcode.com/problems/number-of-ways-to-form-a-target-string-given-a-dictionary/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}


class Solution {
    func numWays(_ words: [String], _ target: String) -> Int {
        let N = target.count
        let M = words[0].count
        var dp = Array<Int>(repeating: 0, count: N + 1)
        dp[0] = 1
        let target2Num = target.map { Int($0.asciiValue!) - 97}
        let words2Num = words.map {$0.map { Int($0.asciiValue!) - 97}}
        for i in 0..<M {
            var indices = Array<Int>(repeating: 0, count: 26)
            for wordNum in words2Num {
                indices[wordNum[i]] += 1
            }
            var j = N - 1
            while j >= 0 {
                dp[j + 1] += dp[j] * indices[target2Num[j]] % Int.mod
                j -= 1
            }
        }
        return dp[N] % Int.mod
    }
}