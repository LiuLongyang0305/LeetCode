  // https://leetcode.cn/problems/minimum-time-to-remove-all-cars-containing-illegal-goods/
    class Solution {
        func minimumTime(_ s: String) -> Int {
            let chars = [Character](s)
            let N = chars.count
            var memo = [[Int]](repeating: [Int](repeating: -1, count: 3), count: N)
            //state  = 0: preffix
            //state  = 1: middle
            //state  = 2: suffix
            func dfs(_ idx: Int, _ lastState: Int) -> Int {

                guard idx < N else {return 0}
                if memo[idx][lastState] != -1 {
                    return memo[idx][lastState]
                }
                var sb = Int.max

                if lastState == 0 {
                    sb = min(sb, 1 + dfs(idx + 1, 0))
                    sb = min(sb, (chars[idx] == "1" ? 2 : 0) + dfs(idx + 1, 1))
                    if chars[idx] == "1" {
                        sb = min(sb, N - idx)
                    } else {
                        sb = min(sb,dfs(idx + 1, 2))
                    }
                }

                if lastState == 1 {
                    sb = min(sb,(chars[idx] == "1" ? 2 : 0) + dfs(idx + 1, 1))
                    if chars[idx] == "1" {
                        sb = min(sb, N - idx)
                    } else {
                        sb = min(sb,dfs(idx + 1, 2))
                    }
                }
                if lastState == 2 {
                    if chars[idx] == "1" {
                        sb = N - idx
                    } else {
                        sb = dfs(idx + 1,2)
                    }
                }
                memo[idx][lastState] = sb
                return sb
            }
            return min(dfs(0,0),dfs(0,1),dfs(0,2))
        }
    }
