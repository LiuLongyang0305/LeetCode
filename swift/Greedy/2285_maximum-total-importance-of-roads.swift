// https://leetcode.com/problems/maximum-total-importance-of-roads/
class Solution {
    func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
        var degree = [Int](repeating: 0, count: n)
        for road in roads {
            degree[road[0]] += 1
            degree[road[1]] += 1
        }
        let sortedDegree = degree.sorted()
        var ans = 0
        var curScore = 1
        for d in sortedDegree {
            ans += curScore * d
            curScore += 1
        }
        return ans
    }
}