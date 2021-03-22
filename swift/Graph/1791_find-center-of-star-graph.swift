// https://leetcode.com/problems/find-center-of-star-graph/
class Solution1 {
    func findCenter(_ edges: [[Int]]) -> Int {
        let N = edges.count +  1
        var degree =  Array<Int>(repeating: 0, count: N + 1)
        for e in edges {
            degree[e[0]] += 1
            degree[e[1]] += 1
        }
        return degree.firstIndex(of: N - 1) ?? -1
    }
}
class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        return (edges[0][0] == edges[1][0] || edges[0][0] == edges[1][1]) ? edges[0][0] : edges[0][1]
    }
}


