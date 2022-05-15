// https://leetcode.com/problems/count-number-of-texts/
class Solution {
    private let MOD = 1_000_000_007
    func countTexts(_ pressedKeys: String) -> Int {
        var memo = [Int:Int]()
        let cnt = [0,0,3,3,3,3,3,4,3,4]
        let keysToInt = pressedKeys.map {Int($0.asciiValue! - 48) }
        let N = pressedKeys.count

        func dfs(from idx: Int) -> Int {

            guard idx < N else {return 1}
            guard nil == memo[idx] else {return memo[idx]!}
            let maxLength = cnt[keysToInt[idx]]
            var ans = 0
            for delta in 0..<maxLength {
                guard  idx + delta < N && keysToInt[idx + delta] == keysToInt[idx] else {
                    break
                }
                ans += dfs(from: idx + delta + 1)
                ans %= MOD
            }

            memo[idx] = ans
            return ans
        }
        return dfs(from: 0)
    }
}