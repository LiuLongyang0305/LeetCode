// https://leetcode.com/problems/maximal-network-rank/
class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var cnt = Array<Int>(repeating: 0, count: n)
        var ans = 0
        var adj = Set<Int>()
        for road in roads {
            cnt[road[0]] += 1
            cnt[road[1]] += 1
            adj.insert(min(road[0], road[1]) << 16 | max(road[0], road[1]))
        }
        var i = 0
        while i < n {
            var j = i + 1
            while j < n {
                ans = max(ans, cnt[i] + cnt[j] - (adj.contains(i << 16 | j) ? 1 : 0) )
                j += 1
            }
            i += 1
        }
        return ans
    }
}