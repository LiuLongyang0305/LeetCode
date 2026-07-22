    // https://leetcode.cn/problems/minimum-operations-to-transform-binary-string/
    class Solution {
        private let INF = 1_000_000_007
        func minOperations(_ s1: String, _ s2: String) -> Int {
            let chars1 = [Character](s1)
            let chars2 = [Character](s2)
            let N = chars1.count

            var memo = [[Int?]](repeating: [Int?](repeating: nil, count: 2), count: N)

            func dfs(_ idx: Int, _ force: Bool) -> Int {
                guard idx < N else {return 0}
                if let sb = memo[idx][force ? 1 : 0] {
                    return sb
                }
                let (c1,c2): (Character,Character) = ( force ? "0" : chars1[idx],chars2[idx])
                var sb = INF
                if c1 == c2 {
                    sb = min(sb,dfs(idx + 1, false))
                }

                //进行操作2
                if idx < N - 1 {
                    var need = 0
                    //首先s[i] 和 s[i + 1]如果不为1则需要翻转
                    need += c1 == "0" ? 1 : 0
                    need += chars1[idx + 1] == "0" ? 1 : 0
                    //此时s[i]s[i + 1] = "11"，翻转为“00”并处理后续
                    need += dfs(idx + 1, true) + 1
                    //如果s2[i] = 1,则仍需要翻转
                    need += c2 == "1" ? 1 : 0
                    sb = min(sb,need)
                }
                //进行操作1
                if c1 == "0" && c2 == "1" {
                    sb = min(sb,dfs(idx + 1, false) + 1)
                }
                memo[idx][force ? 1 : 0] = sb
                return sb
            }

            let sb = dfs(0, false)

            return sb >= INF ? -1 : sb
        }
    }
