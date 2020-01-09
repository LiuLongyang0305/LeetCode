// https://leetcode.com/problems/critical-connections-in-a-network/
class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = Array<[Int]>(repeating: [], count: n)
        for connection in connections {
            graph[connection[0]].append(connection[1])
            graph[connection[1]].append(connection[0])
            
        }
        var ans = [[Int]]()
        
        var low = Array<Int>(repeating: -1, count: n)
        var visited = Array<Bool>(repeating: false, count: n)
        var id = 0
        var dfn = Array<Int>(repeating: -1, count: n)
        
        func dfs(_ at: Int, parent: Int) {
            id += 1
            visited[at] = true
            low[at] = id
            dfn[at] = id
            for to in graph[at] {
                if to == parent{
                    continue
                }
                if !visited[to] {
                    dfs(to, parent: at)
                    low[at] = min(low[at], low[to])
                    if dfn[at] < low[to] {
                        ans.append([at,to])
                    }
                } else {
                    low[at] = min(low[at], dfn[to])
                }
            }
        }
        dfs(0, parent: -1)
        return ans
    }
 }

