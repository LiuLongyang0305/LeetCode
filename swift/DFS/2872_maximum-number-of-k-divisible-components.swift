//https://leetcode.cn/problems/maximum-number-of-k-divisible-components/
class Solution {
    func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
        var tree = [[Int]](repeating: [], count: n)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }

        var sb = 0
        func dfs(_ cur: Int, _ fa: Int) -> Int {
            var subTreeValues = [Int]()

            for next in tree[cur] where next != fa {
                subTreeValues.append(dfs(next, cur))
            }
            var ans = 0
            for v in subTreeValues {
                if v == 0 {
                    sb += 1
                } else {
                    ans += v
                }
            }

            return (ans + values[cur]) % k
        }


        let totalRemain = dfs(0, -1)
        if totalRemain % k == 0 {sb += 1}
        return sb
    }
}
