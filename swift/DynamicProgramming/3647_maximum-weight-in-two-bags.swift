    // https://leetcode.cn/problems/maximum-weight-in-two-bags/
    class Solution {
        func maxWeight(_ weights: [Int], _ w1: Int, _ w2: Int) -> Int {

            let M = weights.count
            var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: M + 5), count: w2 + 5), count: w1 + 5)
            func dfs(_ idx: Int, _ curW1: Int, _ curW2: Int) -> Int {
                guard idx < M else {
                    return curW1 + curW2
                }

                if let v = memo[curW1][curW2][idx] {
                    return v
                }

                var sb = dfs(idx + 1, curW1, curW2)
                if curW1 >= weights[idx] {
                    sb = min(sb,dfs(idx + 1, curW1 - weights[idx], curW2))
                }

                if curW2 >= weights[idx] {
                    sb = min(sb,dfs(idx + 1, curW1, curW2 - weights[idx]))
                }
                memo[curW1][curW2][idx] = sb
                return sb
            }

            return w1 + w2 - dfs(0, w1, w2)
        }
    }
