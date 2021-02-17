// https://leetcode.com/problems/minimum-degree-of-a-connected-trio-in-a-graph/
class Solution {
    func minTrioDegree(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: n + 1), count: n + 1)
        var cnt = Array<Int>(repeating: 0, count: n + 1)
        for edge in edges {
            graph[edge[0]][edge[1]] = true
            graph[edge[1]][edge[0]] = true
            cnt[edge[0]] += 1
            cnt[edge[1]] += 1
        }
        var ans = Int.max
        var i = 1
        while i <= n - 2 {
            var j = i + 1
            while j <= n - 1 {
                if graph[i][j] {
                    var k = j + 1
                    while k <= n {
                        if graph[j][k] && graph[i][k] {
                            ans = min(ans, cnt[i] + cnt[j] + cnt[k] - 6)
                        }
                        k += 1
                    }
                }
                j += 1
            }
            i += 1
        }
        return ans == Int.max ? -1 : ans
    }
}