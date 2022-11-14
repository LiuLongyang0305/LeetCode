 // https://leetcode.com/problems/maximum-number-of-non-overlapping-palindrome-substrings/
class Solution {
    func maxPalindromes(_ s: String, _ k: Int) -> Int {
        guard k > 1 else {return s.count}
        let possibleSplitPoints = splitSubstrings(s, k)
        let N = s.count
        var memo = [Int?](repeating: nil, count: N)
        func  dfs(_ start: Int) -> Int {

            guard start < N else {return 0}

            if let c = memo[start] {
                return c
            }
            var ans = 0

            for possibleStart in start..<N {
                guard let end = possibleSplitPoints[possibleStart] else {
                    continue
                }
                ans = max(ans, 1 + dfs(end + 1))
            }

            memo[start] = ans
            return ans
        }


        return dfs(0)
    }

    private func splitSubstrings(_ s: String, _ limit: Int) -> [Int?] {

        var ans = [Int?](repeating: nil, count: s.count)
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: true, count: s.count), count: s.count)
        for i in 0..<s.count {
            dp[i][i] = true
        }
        let N = s.count
        guard N >= 2 else {
            return ans
        }
        let chars = [Character](s)
        for length in 2...N {
            var left = 0
            while left < N {
                let right = left + length - 1
                guard right < N else {
                    break
                }
                if chars[left] != chars[right] {
                    dp[left][right] = false
                } else {
                    if length <= 3 {
                        dp[left][right] = true
                    } else {
                        dp[left][right] = dp[left + 1][right - 1]
                    }
                }
                if dp[left][right] && length >= limit{
                    if nil == ans[left] {
                        ans[left] = right
                    }
                }
                left += 1
            }
        }
        return ans
    }
}