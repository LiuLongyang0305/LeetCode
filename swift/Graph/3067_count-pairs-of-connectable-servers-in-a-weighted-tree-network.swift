//https://leetcode.cn/problems/count-pairs-of-connectable-servers-in-a-weighted-tree-network/
class Solution {
    func countPairsOfConnectableServers(_ edges: [[Int]], _ signalSpeed: Int) -> [Int] {
        let N = edges.count + 1
        var graph = [Int:[(Int,Int)]]()
        for e in edges{
            graph[e[0],default:[]].append((e[1],e[2]))
            graph[e[1],default:[]].append((e[0],e[2]))
        }

        func dfs(_ p: Int, _ root: Int, _ cur: Int) -> Int {
            var res = 0
            if cur == 0 {
                res += 1
            }
            for (v,cost) in graph[p] ?? [] {
                if v != root {
                    res += dfs(v, p, (cur + cost) % signalSpeed)
                }
            }
            return res
        }
        var sb = [Int](repeating: 0, count: N)
        for i in 0..<N {
            var pre = 0
            for (v,cost) in graph[i] ?? [] {
                let cnt = dfs(v, i, cost % signalSpeed)
                sb[i] += pre * cnt
                pre += cnt
            }
        }
        return sb
    }
}
