// https://leetcode.com/problems/largest-color-value-in-a-directed-graph/
class Solution {
    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        
        let nodesCount = colors.count
        let colorsArr = colors.map {Int($0.asciiValue! - 97)}
        var graph = Array<Array<Int>>(repeating: [], count: nodesCount)
        var cnt = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 26), count: nodesCount)
        var visited = Array<Int>(repeating: 0, count: nodesCount)
        for e in edges {
            graph[e[0]].append(e[1])
        }
        
        func dfs(_ node: Int) -> Bool {
            if visited[node] == 0 {
                visited[node] = 1
                for ch in graph[node] {
                    if !dfs(ch) {
                        return false
                    }
                    var temp = cnt[node]
                    for idx in 0..<26 {
                        temp[idx] = max(temp[idx], cnt[ch][idx])
                    }
                    cnt[node] = temp
                }
                cnt[node][colorsArr[node]] += 1
                visited[node] = 2
            }
            return visited[node] == 2
        }
        var ans = 0
        for node in 0..<nodesCount {
            if !dfs(node) {
                return -1
            }
            ans = max(ans, cnt[node].max()!)
        }
        return ans
    }
}

