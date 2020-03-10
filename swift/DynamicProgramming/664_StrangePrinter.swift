 // https://leetcode.com/problems/strange-printer/
 class Solution {
    private var memo: [[Int]] = []
    private var chars: [Character] = []
    func strangePrinter(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        chars = Array<Character>(s)
        let N = s.count
        memo = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: N)
        return dp(0, N - 1)
    }
    private func dp(_ i: Int, _ j: Int) -> Int {
        guard i <= j else {
            return 0
        }
        guard memo[i][j] == 0 else {
            return memo[i][j]
        }
        var ans = dp(i + 1, j) + 1
        var k = i + 1
        while k <= j {
            if chars[k] == chars[i] {
                ans = min(ans, dp(i, k - 1) + dp(k + 1,j))
            }
            k += 1
        }
        memo[i][j] = ans
        return ans
    }
 }

 
