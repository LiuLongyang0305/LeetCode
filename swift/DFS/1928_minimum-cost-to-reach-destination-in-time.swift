// https://leetcode.com/problems/minimum-cost-to-reach-destination-in-time/
class Solution {
    func minCost(_ maxTime: Int, _ edges: [[Int]], _ passingFees: [Int]) -> Int {
        
        let N = passingFees.count
        
        var tree = Array<Set<Int>>(repeating: [], count: N)
        var costTime = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max >> 1, count: N), count: N)
        for edge in edges {
            let first = edge[0]
            let second = edge[1]
            let cost = edge[2]
            if !tree[first].contains(second) {
                tree[first].insert(second)
            }
            if !tree[second].contains(first) {
                tree[second].insert(first)
            }
            if costTime[first][second] > cost {
                costTime[first][second] = cost
                costTime[second][first] = cost
            }
        }
        var minTimeOfEachNode = Array<Int>(repeating: Int.max, count: N)
        var minCostOfEachNode = Array<Int>(repeating: Int.max, count: N)
        var ans = Int.max
        var visited = Array<Bool>(repeating: false, count: N)
        func  dfs(_ node: Int,_ time: Int, _ cost: Int) {
            guard node != N - 1 else {
                if time <= maxTime {
                    ans = min(ans, cost)
                }
                return
            }
            guard time < maxTime  && cost < ans else {
                return
            }
            guard time < minTimeOfEachNode[node] || cost < minCostOfEachNode[node] else {
                return
            }
            if time < minTimeOfEachNode[node] {
                minTimeOfEachNode[node] = time
            }
            if cost < minCostOfEachNode[node] {
                minCostOfEachNode[node] = cost
            }
            visited[node] = true
            for next in tree[node] {
                if !visited[next] {
                    dfs(next, time + costTime[node][next], cost + passingFees[next])
                }
            }
            visited[node] = false
        }
        dfs(0, 0, passingFees[0])
        return ans == Int.max ? -1 : ans
    }
}

