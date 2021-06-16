// https://leetcode.com/problems/palindrome-partitioning-ii/
class Solution {
    private var chars: [Character] = []
    private var dp = Array<Array<Bool>>()
    private var M = -1
    private var memo = [Int:Int]()
    func minCut(_ s: String) -> Int {
        guard s.count > 1 else {
            return 0
        }
        self.chars = [Character](s)
        self.M = s.count
        self.memo = [:]
        solveDp()
        return helper(0,M - 1)
    }
    private func helper(_ left: Int, _ right: Int) -> Int {
        guard left < right else {
            return 0
        }
        guard !dp[left][right] else {
            return 0
        }
        let key = left << 32 | right
        guard nil == memo[key] else {
            return memo[key]!
        }
        var ans = right - left
        var k = left
        while k < right {
            if dp[left][k] {
                ans = min(ans, 1 + helper(k + 1, right))
            }
            k += 1
        }
        memo[key] = ans
        return ans
    }
    private func solveDp() {
        self.dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: M + 1), count: M + 1)
        (0..<M).forEach { idx in
            dp[idx][idx] = true
            if idx + 1 < M {
                if chars[idx] == chars[idx + 1] {
                    dp[idx][idx + 1] = true
                }
            }
        }
        var length = 3
        while length <= M {
            var left = 0
            while left < M {
                let right = left + length - 1
                guard right < M else {
                    break
                }
                if chars[left] == chars[right] && dp[left + 1][right - 1] {
                    dp[left][right] = true
                }
                left += 1
            }
            length += 1
        }
    }
}



