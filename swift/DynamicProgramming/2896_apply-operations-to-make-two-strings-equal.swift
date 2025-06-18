// https://leetcode.com/problems/apply-operations-to-make-two-strings-equal
class Solution {
    func minOperations(_ s1: String, _ s2: String, _ x: Int) -> Int {

        let s1Chars = [Character](s1)
        let s2Chars = [Character](s2)
        guard (countOne(in: s1Chars) & 1 ) == (countOne(in: s2Chars) & 1) else {return -1}

        let N = s1.count
        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: 2), count: N + 5), count: N + 5)


        func dfs(_ cur: Int, _ reverseTimes: Int, _ isPreReversed:Bool) -> Int {
            guard cur < N else {return 0}
            let curChar = isPreReversed ? (s1Chars[cur] == "0" ? "1" : "0") : s1Chars[cur]
            
            if let v = memo[cur][reverseTimes][isPreReversed ? 0 : 1] {
                return v
            }
            var ans = Int.max / 2
            if curChar == s2Chars[cur] {
                //同一位置相同，则跳过，贪心
                ans =  dfs(cur + 1, reverseTimes, false)
            } else {
                //可以自由翻转
                if reverseTimes > 0 {
                    ans = min(ans,dfs(cur + 1, reverseTimes - 1, false))
                }
                //重新反转，视为操作1的前一个坐标
                ans = min(ans,x + dfs(cur + 1, reverseTimes + 1, false))
                //翻转 cur以及cur+ 1
                ans = min(ans,1 + dfs(cur + 1, reverseTimes, true))

            }

            memo[cur][reverseTimes][isPreReversed ? 0 : 1] = ans
            return ans
        }


        return dfs(0, 0, false)
    }

    private func countOne(in chars: [Character]) -> Int {
        var ans = 0
        for ch in chars {
            if ch == "1" {
                ans += 1
            }
        }
        return ans
    }
}

