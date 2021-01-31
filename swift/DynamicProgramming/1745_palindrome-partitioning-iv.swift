// https://leetcode.com/problems/palindrome-partitioning-iv/
class Solution {
    func checkPartitioning(_ s: String) -> Bool {
        guard s.count != 3 else {
            return true
        }
        let s2Chars = [Character](s)
        let N = s.count
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: N)
        (0..<N).forEach {dp[$0][$0] = true}
        for j in 1..<N {
            for i in 0..<j {
                if s2Chars[i] == s2Chars[j] && (j - i < 3 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                }
            }
        }
        var first = [Int]()
        var second = [Int]()
        for i in 0..<N {
            if dp[0][i] {
                first.append(i)
            }
            if dp[i][N - 1] {
                second.append(i)
            }
        }
        for f in first {
            while !second.isEmpty && second.first! <= f  {
                second.removeFirst()
            }
            guard !second.isEmpty else {
                return false
            }
            for s in second {
                guard !dp[f + 1][s - 1] else {
                    return true
                }
            }
        }
        return false
    }
}

